import 'package:e_commerce_app_route/data/model/RegisterResponseDM.dart';

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;

}

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      });

  String? name;
  String? email;

}