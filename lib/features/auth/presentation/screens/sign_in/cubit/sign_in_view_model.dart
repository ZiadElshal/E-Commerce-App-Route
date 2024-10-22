import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app_route/features/auth/presentation/screens/sign_in/cubit/sign_in_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  // var emailController = TextEditingController(text: 'amira111@route.com');
  // var passwordController = TextEditingController(text: 'Amira123');

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  //todo: hold data - handle logic

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
      emailController.text,
      passwordController.text,
    );
    either.fold((l) {
      emit(LoginErrorState(failures: l));
    }, (response) {
      emit(LoginSuccessState(responseEntity: response));
    });
  }
}
