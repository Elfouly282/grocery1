import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/domain/entities/CategoriesResponseEntity.dart';
import 'package:grocery1/domain/repositories/repositories/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/datasourses/remoteDataSourse/CategoriesDataSource.dart';
@Injectable(as: Categoriesrepository)
class CategoriesRepositoryImpl implements Categoriesrepository{
  CategoriesDataSource dataSource;
  CategoriesRepositoryImpl({
    required this.dataSource
});
  @override
  Future<Either<Failure, CategoriesResponseEntity>> getAllCategory() async{
    var either=await dataSource.getAllCategory();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}