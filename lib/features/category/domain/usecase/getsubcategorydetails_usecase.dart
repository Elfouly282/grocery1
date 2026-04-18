import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/category/domain/entities/meal_entity.dart';
import 'package:grocery1/features/category/domain/repo/subcate_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class GetsubcategorydetailsUsecase {
  final SubcategoryRepository subcategoryrepository;
  GetsubcategorydetailsUsecase({required this.subcategoryrepository});

  Future<Either<Failure, List<MealEntity>>> call(int id) async {
    return await subcategoryrepository.getmeals(id);
  }
}
