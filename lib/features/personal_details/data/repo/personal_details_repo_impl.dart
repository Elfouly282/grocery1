import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/personal_details_repo.dart';
import '../models/profile_model.dart';
import '../../../../../core/api/api_endpoints.dart';

class PersonalDetailsRepoImpl implements PersonalDetailsRepo {
  final ApiManger apiManger;

  PersonalDetailsRepoImpl({required this.apiManger});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final response = await apiManger.getData(
        endPoint: ApiEndpoints.getProfile,
        headers: {
         //Token example
          'Authorization': 'Bearer 804|63sRvZoUtX13wYOnpGgKWbPYpI3cpe0RfoEmhIjy9fd36d89',
        },
      );
      print('✅ response: ${response.data}');
      return Right(ProfileModel.fromJson(response.data));
    } catch (e) {
      print('❌ error: $e');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(ProfileEntity profile) async {
    try {
      await apiManger.putData(
        endPoint: ApiEndpoints.updateProfile,
        headers: {
          // token example
          'Authorization': 'Bearer 804|63sRvZoUtX13wYOnpGgKWbPYpI3cpe0RfoEmhIjy9fd36d89',
        },
        body: ProfileModel(
          username: profile.username,
          firstname: profile.firstname,
          lastname: profile.lastname,
          email: profile.email,
          phone: profile.phone,
          countryCode: profile.countryCode,
          preferredLanguage: profile.preferredLanguage,
        ).toJson(),
      );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        print('❌ update error: ${e.response?.data}');
      }
      return Left(Failure(e.toString()));
    }}
}