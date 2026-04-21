import 'package:dartz/dartz.dart';
import 'package:grocery1/Features/SubCategories/domain/entities/CategoriesResponseEntity.dart';
import 'package:grocery1/core/failure/failure.dart';

abstract class Categoriesrepository {
   Future<Either<Failure,CategoriesResponseEntity>>getAllCategory();
}

