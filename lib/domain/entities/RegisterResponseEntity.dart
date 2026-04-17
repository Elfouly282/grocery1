class RegisterResponseEntity{
  RegisterResponseEntity({
    this.message,
    this.user,
    this.statusMsg,
    this.token,});
  String? message;
  UserEntity? user;
  String? statusMsg;
  String? token;

}

class UserEntity {
  UserEntity({
    this.id,
    this.name,
    this.email,
    this.role,});
  String?id;
  String? name;
  String? email;
  String? role;


}