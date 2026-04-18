import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/feature/product_details/domain/entity/product_details_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsResponseEntity>> getProductDetails(
    int productId,
  );
}
