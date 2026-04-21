import 'package:dartz/dartz.dart';
import 'package:grocery1/Features/SubCategories/domain/repositories/datasourses/remoteDataSourse/CategoryDetailsDataSource.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/domain/entities/CategoryDetailsResponseEntity.dart';
import 'package:grocery1/domain/repositories/repositories/CategoryDetailsRepository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoryDetailsRepository)
class Categorydetailsrepositoryimpl extends CategoryDetailsRepository{
  CategoryDetailsDatasource datasource;
  Categorydetailsrepositoryimpl({required this.datasource});
  @override
  Future<Either<Failure, CategoryDetailsResponseEntity>> getCategoryDetails(int id) async{
      return datasource.getCategoryDetails(id);
    }

  }

