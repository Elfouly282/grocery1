import 'subcategorydetails_model.dart';

class SubCategoryDetailsResponse {
  bool? success;
  String? message;
  SubcategoryDetailsModel? data;

  SubCategoryDetailsResponse({this.success, this.message, this.data});

  factory SubCategoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoryDetailsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SubcategoryDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}
