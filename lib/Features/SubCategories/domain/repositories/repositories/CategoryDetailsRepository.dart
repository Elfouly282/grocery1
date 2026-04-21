import 'package:dartz/dartz.dart';
import 'package:grocery1/Features/SubCategories/domain/entities/CategoryDetailsResponseEntity.dart';
import 'package:grocery1/core/failure/failure.dart';

  abstract class CategoryDetailsRepository {
  Future<Either<Failure, CategoryDetailsResponseEntity>> getCategoryDetails(int id);
}