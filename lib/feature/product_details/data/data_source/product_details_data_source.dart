import 'package:grocery1/feature/product_details/domain/entity/product_details_entity.dart';

abstract class ProductDetailsDataSource {
  Future<ProductDetailsResponseEntity> getProductDetails(int productId);
}
