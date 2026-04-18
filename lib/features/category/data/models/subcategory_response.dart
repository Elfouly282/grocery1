import 'package:grocery1/features/category/data/models/subcategory_model.dart';

class SubcategoryResponse {
  bool? success;
  String? message;
  List<SubcategoryModel> subcategories;

  SubcategoryResponse({
    this.success,
    this.message,
    required this.subcategories,
  });

  factory SubcategoryResponse.fromJson(Map<String, dynamic> json) =>
      SubcategoryResponse(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        subcategories:
            (json['data'] as List<dynamic>?)
                ?.map(
                  (e) => SubcategoryModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            [],
      );
}
