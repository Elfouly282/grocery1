import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/domain/entities/CategoryDetailsResponseEntity.dart';

  abstract class CategoryDetailsRepository {
  Future<Either<Failure, CategoryDetailsResponseEntity>> getCategoryDetails(int id);
}