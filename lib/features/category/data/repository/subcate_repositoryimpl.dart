import 'package:dartz/dartz.dart';
import 'package:grocery1/core/error/error.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/category/data/data_source/subcategory_datasource.dart';
import 'package:grocery1/features/category/domain/entities/meal_entity.dart';
import 'package:grocery1/features/category/domain/entities/subcategories_entity.dart';
import 'package:grocery1/features/category/domain/repo/subcate_repository.dart';
import 'package:grocery1/features/category/data/mappers/subcategory_mapper.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubcategoryRepository)
class SubcateRepositoryimpl implements SubcategoryRepository {
  SubcateRepositoryimpl({required this.subcategoryDatasource});
  final SubcategoryDatasource subcategoryDatasource;

  @override
 Future<Either<Failure, List<SubcategoriesEntity>>> getSubcategories() async {
  try {
    final response = await subcategoryDatasource.getSubcategories();

    final list = response.subcategories
        .map((e) => e.toEntity())
        .toList();

    return Right(list);

  } catch (e, stack) {
    print("🔥 FULL ERROR: $e");
    print("📌 STACK: $stack");

    return Left(Failure(e.toString()));
  }
}

  @override
  Future<Either<Failure, List<MealEntity>>> getmeals(int id) async {
    try {
      final resposne = await subcategoryDatasource.getSubcategoryDetails(id);
      final meals = resposne.data?.meals ?? [];
      final list = meals.map((e) => e.toEntity()).toList();
      return Right(list);
    } on Appexception catch (e) {
      return Left(Failure(e.errormessage));
    }
  }
}
