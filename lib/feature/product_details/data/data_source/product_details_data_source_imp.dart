import 'package:grocery1/feature/product_details/data/api/product_details_api.dart';
import 'package:grocery1/feature/product_details/data/data_source/product_details_data_source.dart';
import 'package:grocery1/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsDataSource)
class ProductDetailsDataSourceImp extends ProductDetailsDataSource {
  final ProductDetailsApi _productDetailsApi;
  ProductDetailsDataSourceImp(this._productDetailsApi);
  @override
  Future<ProductDetailsResponseEntity> getProductDetails(int productId) async {
    final responseModel = await _productDetailsApi.fetchProductDetails(
      productId,
    );
    var responseEntity = responseModel.toEntity();
    return responseEntity;
  }
}
