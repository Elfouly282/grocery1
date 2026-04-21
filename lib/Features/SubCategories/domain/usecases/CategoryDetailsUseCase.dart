import 'package:dartz/dartz.dart';
import 'package:grocery1/Features/SubCategories/domain/entities/CategoryDetailsResponseEntity.dart';
import 'package:grocery1/Features/SubCategories/domain/repositories/repositories/CategoryDetailsRepository.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryDetailsUseCase {
  final CategoryDetailsRepository categoryDetails;

  CategoryDetailsUseCase({required this.categoryDetails});

  Future<Either<Failure, CategoryDetailsResponseEntity>> invoke(int id) {
    return categoryDetails.getCategoryDetails(id);
  }
}