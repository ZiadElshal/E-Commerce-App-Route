import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app_route/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/RegisterResponseEntity.dart';
import '../failures.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(String email,
      String password){
    return authRepository.login(email, password);
  }
}
