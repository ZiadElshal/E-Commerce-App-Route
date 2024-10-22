import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:e_commerce_app_route/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerce_app_route/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:e_commerce_app_route/features/cart/cubit/cart_states.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/GetCartResponseEntity.dart';

@injectable
class CartScreenViewModel extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartInitialState());

  //todo: hold data - handle logic
  List<GetProductCartEntity> productList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((l) => emit(GetCartErrorState(failures: l)), (response) {
      productList = response.data!.products ?? [];
      emit(GetCartSuccessState(cartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) => emit(DeleteItemInCartErrorState(failures: l)),
        (response) {
      // productList = response.data!.products ?? [];
      emit(GetCartSuccessState(cartResponseEntity: response));
    });
  }

  void updateCountInCart(String productId, int count) async {
    emit(UpdateCountInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) {
      print('error: ${l.errorMessage}');
      emit(UpdateCountInCartErrorState(failures: l));
    }, (response) {
      // productList = response.data!.products ?? [];
      emit(GetCartSuccessState(cartResponseEntity: response));
    });
  }
}
