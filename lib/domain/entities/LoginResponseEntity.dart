import 'package:e_commerce_app_route/data/model/RegisterResponseDM.dart';

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  String? message;
  String? statusMsg;
  LoginUserEntity? user;
  String? token;

}

class LoginUserEntity {
  LoginUserEntity({
      this.name, 
      this.email, 
      });

  String? name;
  String? email;

}