import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/category/domain/entities/meal_entity.dart';
import 'package:grocery1/features/category/domain/entities/subcategories_entity.dart';

abstract class SubcategoryRepository {
  Future<Either<Failure, List<SubcategoriesEntity>>> getSubcategories();
   Future<Either<Failure, List<MealEntity>>> getmeals(int id) ;

}
