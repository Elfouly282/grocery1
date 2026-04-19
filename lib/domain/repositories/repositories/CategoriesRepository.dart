import 'package:dartz/dartz.dart';
import 'package:grocery1/domain/entities/CategoriesResponseEntity.dart';

import '../../../core/failure/failure.dart';
abstract class Categoriesrepository {
   Future<Either<Failure,CategoriesResponseEntity>>getAllCategory();
}

