import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/features/category/data/models/sub_category_details/subcategorydetails_response.dart';
import 'package:injectable/injectable.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/features/category/data/data_source/subcategory_datasource.dart';
import 'package:grocery1/features/category/data/models/subcategory_response.dart';

@LazySingleton(as: SubcategoryDatasource)
class ApiDatasource implements SubcategoryDatasource {
  final ApiManger api;
  ApiDatasource({required this.api});

  @override
  Future<SubcategoryResponse> getSubcategories() async {
    try {
      final response = await api.getData(
        endPoint: ApiEndpoints.subcategoryEndpoint,
      );

      return SubcategoryResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data["message"];
      }
      throw RemoteException(message ?? 'Failed to get Sub categories');
    }
  }

  @override
  Future<SubCategoryDetailsResponse> getSubcategoryDetails(int id) async {
    String? message;
    try {
      final response = await api.getData(
        endPoint: '${ApiEndpoints.subcategoryEndpoint}/$id',
      );
      print("✅ RAW RESPONSE: ${response.data}");
      return SubCategoryDetailsResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        message = e.response?.data["message"];
      }
      throw RemoteException(message ?? 'Failed to get Subcategories Detalis');
    }
  }
}
// catch to fetch any error 
/*
  catch (e, stack) {
        print("🔥 DIO ERROR: $e");
        print("📌 STACK: $stack");

        if (e is DioException) {
          print("🔥 RESPONSE: ${e.response?.data}");
        }

        throw RemoteException(
          e is DioException
              ? (e.response?.data?["message"]?.toString() ?? "Dio error")
              : e.toString(),
        );
      }
 */
           