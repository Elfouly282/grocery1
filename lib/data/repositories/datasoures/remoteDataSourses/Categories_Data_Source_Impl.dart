import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/data/models/CategoriesResponseDM.dart';
import 'package:grocery1/domain/entities/CategoriesResponseEntity.dart';
import 'package:grocery1/domain/repositories/datasourses/remoteDataSourse/CategoriesDataSource.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CategoriesDataSource)

class CategoriesDataSourceImpl implements CategoriesDataSource {
  ApiManger apiManger;

  CategoriesDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failure, CategoriesResponseEntity>> getAllCategory() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (!connectivityResult.contains(ConnectivityResult.wifi) &&
          !connectivityResult.contains(ConnectivityResult.mobile)) {
        return Left(Failure('No Internet Connection'));
      }

      final response = await apiManger.getData(
        endPoint: ApiEndpoints.cateEndpoint,
      );

      final getAllCategoriesResponse =
      CategoriesResponseDm.fromJson(response.data);

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return Right(getAllCategoriesResponse); // ✅ FIXED
      }

      return Left(
        Failure(getAllCategoriesResponse.message ?? 'Something went wrong'),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}