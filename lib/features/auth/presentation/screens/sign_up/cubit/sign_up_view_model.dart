import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app_route/features/auth/presentation/screens/sign_up/cubit/sign_up_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  // var nameController = TextEditingController(text: 'Amira');
  // var emailController = TextEditingController(text: 'amira111@route.com');
  // var passwordController = TextEditingController(text: 'Amira123');
  // var rePasswordController = TextEditingController(text: 'Amira123');
  // var phoneController = TextEditingController(text: '01232323232');

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var phoneController = TextEditingController();

  RegisterScreenViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  //todo: hold data - handle logic

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text);
    either.fold((l) {
      emit(RegisterErrorState(failures: l));
    }, (response) {
      emit(RegisterSuccessState(responseEntity: response));
    });
  }
}
