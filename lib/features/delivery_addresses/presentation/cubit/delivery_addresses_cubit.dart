import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/delivery_addresses_repo.dart';
import 'delivery_addresses_state.dart';

class DeliveryAddressesCubit extends Cubit<DeliveryAddressesState> {
  final DeliveryAddressesRepo repo;

  DeliveryAddressesCubit({required this.repo}) : super(DeliveryAddressesInitial());

  Future<void> getAddresses() async {
    emit(DeliveryAddressesLoading());
    final result = await repo.getAddresses();
    result.fold(
          (failure) => emit(DeliveryAddressesError(message: failure.failuremessage)),
          (addresses) => emit(DeliveryAddressesLoaded(addresses: addresses)),
    );
  }

  Future<void> storeAddress(AddressEntity address) async {
    emit(DeliveryAddressesStoreLoading());
    final result = await repo.storeAddress(address);
    result.fold(
          (failure) => emit(DeliveryAddressesError(message: failure.failuremessage)),
          (_) async {
            emit(DeliveryAddressesStoreSuccess());
          await  getAddresses();

          }
    );
  }
}