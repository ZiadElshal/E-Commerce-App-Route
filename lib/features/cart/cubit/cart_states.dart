import 'package:e_commerce_app_route/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  GetCartSuccessState({required this.cartResponseEntity});
}

class DeleteItemInCartLoadingState extends CartStates {}

class DeleteItemInCartErrorState extends CartStates {
  Failures failures;

  DeleteItemInCartErrorState({required this.failures});
}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  DeleteItemInCartSuccessState({required this.cartResponseEntity});
}

class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Failures failures;

  UpdateCountInCartErrorState({required this.failures});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity cartResponseEntity;

  UpdateCountInCartSuccessState({required this.cartResponseEntity});
}
