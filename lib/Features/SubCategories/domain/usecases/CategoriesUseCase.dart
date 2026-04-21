import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/domain/entities/CategoriesResponseEntity.dart';
import 'package:grocery1/domain/repositories/repositories/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoriesUseCase {
Categoriesrepository categoriesrepository;
CategoriesUseCase({required this.categoriesrepository});
Future<Either<Failure,CategoriesResponseEntity>> invoke(){
  return categoriesrepository.getAllCategory();
}
}