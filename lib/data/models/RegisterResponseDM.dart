import '../../domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDm  extends RegisterResponseEntity{
  RegisterResponseDm({
    super.message,
    super.user,
    super.statusMsg,
    super.token,});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg=json['statusMsg'];
    user = json['user'] !=null ? UserDM.fromJson(json['user']) : null;
    token = json['token'];
  }
}
class UserDM extends UserEntity{
  UserDM({
    super.id,
    super.name,
    super.email,
    super.role,});

  UserDM.fromJson(dynamic json) {
    id= json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}