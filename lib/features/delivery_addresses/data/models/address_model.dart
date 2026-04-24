
import '../../domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    super.id,
    super.label,
    super.fullName,
    super.phone,
    super.streetAddress,
    super.buildingNumber,
    super.floor,
    super.apartment,
    super.landmark,
    super.city,
    super.state,
    super.postalCode,
    super.country,
    super.notes,
    super.isDefault,
    super.fullAddress,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      label: json['label'],
      fullName: json['full_name'],
      phone: json['phone'],
      streetAddress: json['street_address'],
      buildingNumber: json['building_number'],
      floor: json['floor'],
      apartment: json['apartment'],
      landmark: json['landmark'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      notes: json['notes'],
      isDefault: json['is_default'],
      fullAddress: json['full_address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'full_name': fullName,
      'phone': phone,
      'street_address': streetAddress,
      'building_number': buildingNumber,
      'floor': floor,
      'apartment': apartment,
      'landmark': landmark,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
      'notes': notes,
      'is_default': isDefault,
    };
  }
}