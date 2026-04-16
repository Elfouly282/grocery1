class LoginResponseModel {
  final String message;
  final dynamic data;

  LoginResponseModel({required this.message, required this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(message: json['message'], data: json['data']);
  }
}
