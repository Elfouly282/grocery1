import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/productslist/domain/entities/subcategories_entity.dart';
import 'package:grocery1/features/productslist/domain/repo/subcate_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSubcategoriesUseCase {
  final SubcategoryRepository subcaterepository;
  const GetSubcategoriesUseCase({required this.subcaterepository});

  Future<Either<Failure, List<SubcategoriesEntity>>> call() =>
      subcaterepository.getSubcategories();
}
