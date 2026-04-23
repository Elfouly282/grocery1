import 'package:dio/dio.dart';
import 'package:grocery1/core/api/api_constant.dart';
import 'package:grocery1/features/list/data/models/add_new_list_model.dart';

class AddNewListRemoteData {
  final Dio dio;

  AddNewListRemoteData(this.dio);

  final String baseUrl = ApiConstant.baseUrl;

  /// 🔹 GET ALL
  Future<List<AddNewListModel>> getSmartLists() async {
    final response = await dio.get("$baseUrl/smart-lists");

    return (response.data as List)
        .map((e) => AddNewListModel.fromJson(e))
        .toList();
  }

  /// 🔹 GET ONE
  Future<AddNewListModel> getSmartList(int id) async {
    final response = await dio.get("$baseUrl/smart-lists/$id");

    return AddNewListModel.fromJson(response.data);
  }

  /// 🔹 CREATE
  Future<void> createSmartList({
    required String name,
    String? description,
    String? imagePath,
    required List<int> mealIds,
  }) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "description": description,
      "meal_ids[]": mealIds,
      if (imagePath != null) "image": await MultipartFile.fromFile(imagePath),
    });

    await dio.post("$baseUrl/smart-lists", data: formData);
  }

  /// 🔹 UPDATE
  Future<void> updateSmartList({
    required int id,
    required String name,
    String? description,
    required List<int> mealIds,
  }) async {
    await dio.put(
      "$baseUrl/smart-lists/$id",
      data: {"name": name, "description": description, "meal_ids": mealIds},
    );
  }

  /// 🔹 DELETE
  Future<void> deleteSmartList(int id) async {
    await dio.delete("$baseUrl/smart-lists/$id");
  }
}
