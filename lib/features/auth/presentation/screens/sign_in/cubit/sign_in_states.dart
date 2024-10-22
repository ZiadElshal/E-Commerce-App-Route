import 'package:e_commerce_app_route/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app_route/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{
  Failures failures ;
  LoginErrorState({required this.failures});
}
class LoginSuccessState extends LoginStates {
  LoginResponseEntity responseEntity ;
  LoginSuccessState({required this.responseEntity});
}