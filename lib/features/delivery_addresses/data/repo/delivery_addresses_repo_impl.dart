import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/delivery_addresses_repo.dart';
import '../models/address_model.dart';
import '../../../../../core/api/api_endpoints.dart';

class DeliveryAddressesRepoImpl implements DeliveryAddressesRepo {
  final ApiManger apiManger;

  DeliveryAddressesRepoImpl({required this.apiManger});

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    try {
      final response = await apiManger.getData(
        endPoint: ApiEndpoints.getAddresses,
        headers: {
          // example
          'Authorization': 'Bearer 804|63sRvZoUtX13wYOnpGgKWbPYpI3cpe0RfoEmhIjy9fd36d89',
        },
      );
      print('✅ addresses: ${response.data}');
      final List data = response.data['data'];
      return Right(data.map((e) => AddressModel.fromJson(e)).toList());
    } catch (e) {
      print('❌ error: $e');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressEntity>> storeAddress(AddressEntity address) async {
    try {
      final response = await apiManger.postData(
        endPoint: ApiEndpoints.storeAddress,
        headers: {
          // example
          'Authorization': 'Bearer 804|63sRvZoUtX13wYOnpGgKWbPYpI3cpe0RfoEmhIjy9fd36d89',
        },
        body: AddressModel(
          fullName: address.fullName,
          phone: address.phone,
          streetAddress: address.streetAddress,
          city: address.city,
          country: address.country,
          isDefault: address.isDefault,
        ).toJson(),
      );
      return Right(AddressModel.fromJson(response.data['data']));
    } catch (e) {
      if (e is DioException) {
        print('❌ store error details: ${e.response?.data}');
      }
      return Left(Failure(e.toString()));
    }
  }
}