import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_route/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app_route/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app_route/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app_route/features/products_screen/presentation/cubit/product_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenViewModel extends Cubit<ProductScreenStates> {
  GetAllProductUseCase getAllProductUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductScreenViewModel(
      {required this.getAllProductUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());

  //todo: hold data - handle logic
  List<ProductEntity>? productsList = [];
  int numOfCartItems = 0;

  static ProductScreenViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductUseCase.invoke();
    either.fold((l) {
      emit(ProductErrorState(failures: l));
    }, (response) {
      productsList = response.data!;
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorState(failures: l));
    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print('numOfCartItems: $numOfCartItems');
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
    });
  }
}
