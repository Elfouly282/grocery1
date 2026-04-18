import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/feature/product_details/data/models/product_details_model.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class ProductDetailsApi {
  final ApiManager _apiManager = ApiManager();
  Future<ProductDetailsResponseModel> fetchProductDetails(int productId) async {
    try {
      final response = await _apiManager.getData(endPoint: 'meals/$productId');
      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw RemoteException(
          'Failed to load product details: ${response.statusCode}',
        );
      }
      var data = ProductDetailsResponseModel.fromJson(response.data);
      return data;
    } catch (e) {
      throw RemoteException('Failed to load product details: $e');
    }
  }
}
