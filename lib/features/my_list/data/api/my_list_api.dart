import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_constant.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/features/my_list/data/models/favorite_model.dart';
import 'package:grocery1/features/my_list/data/models/favorite_toggle_model.dart';
import 'package:grocery1/features/my_list/data/models/history_model.dart';
import 'package:grocery1/features/my_list/data/models/smart_list_model.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class MyListApi {
  final ApiManager _apiManager = ApiManager();

  Future<SmartListResponseModel> fetchSmartLists() async {
    try {
      final response = await _apiManager.getData(
        endPoint: ApiEndpoints.smartListsEndpoint,
        headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return SmartListResponseModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }

  Future<FavoriteResponseModel> fetchFavorites() async {
    try {
      final response = await _apiManager.getData(
        endPoint: ApiEndpoints.favoritesEndpoint,
        headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return FavoriteResponseModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException('$e');
    }
  }

  Future<HistoryResponseModel> fetchHistory({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _apiManager.getData(
        endPoint: ApiEndpoints.historyEndpoint,
        queryParameters: queryParameters,
        headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return HistoryResponseModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException('$e');
    }
  }

  Future<String> deleteSmartList(int id) async {
    try {
      final response = await _apiManager.deleteData(
        endPoint: "${ApiEndpoints.smartListsEndpoint}$id",
        headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return response.statusMessage ?? 'Success';
    } catch (e) {
      throw RemoteException('$e');
    }
  }

  Future<String> addToCart({required int mealId, required int quantity}) async {
    try {
      var response = await _apiManager.postData(
        endPoint: ApiEndpoints.cartItemsEndpoint,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ApiConstant.token}',
        },
        body: {"meal_id": mealId.toString(), "quantity": quantity.toString()},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return response.statusMessage ?? 'Success';
    } catch (e) {
      if (e is DioException && e.response != null) {
        final errorMessage =
            e.response?.data['message'] ?? "Something went wrong";
        throw RemoteException(errorMessage);
      }
      throw RemoteException('$e');
    }
  }

  Future<FavoriteToggleDataModel> removeFavorite(int mealId) async {
    try {
      var response = await _apiManager.postData(
        endPoint:
            "${ApiEndpoints.favoritesEndpoint}$mealId/${ApiEndpoints.toggleFavoriteEndpoint}",
        headers: {'Authorization': 'Bearer ${ApiConstant.token}'},
        body: {"meal_id": mealId},
      );
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          '${response.statusCode},${response.statusMessage}',
        );
      }
      return FavoriteToggleDataModel.fromJson(response.data);
    } catch (e) {
      throw RemoteException('$e');
    }
  }
}
