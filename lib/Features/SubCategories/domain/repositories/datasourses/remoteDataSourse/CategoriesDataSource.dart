import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/domain/entities/CategoriesResponseEntity.dart';


abstract class CategoriesDataSource {
  Future<Either<Failure,CategoriesResponseEntity>>getAllCategory();
}

