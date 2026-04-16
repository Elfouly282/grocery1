class RequestLoginModel {
  final String login;
  final String password;

  RequestLoginModel({required this.login, required this.password});

  /// Convert from JSON to Model
  factory RequestLoginModel.fromJson(Map<String, dynamic> json) {
    return RequestLoginModel(
      login: json['login'] ?? '',
      password: json['password'] ?? '',
    );
  }

  /// Convert from Model to JSON
  Map<String, dynamic> toJson() {
    return {'login': login, 'password': password};
  }
}
