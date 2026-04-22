
import 'deal_model.dart';

class DealsResponseModel {
  final bool success;
  final String message;
  final List<DealModel> data;

  DealsResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DealsResponseModel.fromJson(Map<String, dynamic> json) {
    return DealsResponseModel(
      success: json['success'],
      message: json['message'],
      data: List<DealModel>.from(
        json['data'].map((x) => DealModel.fromJson(x)),
      ),
    );
  }
}