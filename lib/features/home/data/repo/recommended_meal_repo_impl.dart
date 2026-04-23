import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/features/home/data/data_source/recommended_meal_remote_data_source.dart';
import 'package:grocery1/features/home/domain/entity/recommended_meal_entity.dart';
import 'package:grocery1/features/home/domain/repo/recommended_meal_repo.dart';

class RecommendedMealRepoImpl  implements RecommendedMealRepo{
  final RecommendedMealRemoteDataSource recommendedMealRemoteDataSource;

  RecommendedMealRepoImpl(this.recommendedMealRemoteDataSource);

  @override
  Future<Either<Failure, List<RecommendedMealEntity>>> getRecommendedForYou()async {
 try{
   final model=await recommendedMealRemoteDataSource.getRecommendedForYou();
   final entities = model.map((e) => e.toEntity()).toList();
         return Right(entities);
 } catch (e) {
   return Left(Failure(failuremessage: e.toString()));
 }
 }

  }

