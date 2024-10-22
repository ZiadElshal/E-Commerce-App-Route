import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';
import 'package:e_commerce_app_route/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepository.updateCountInCart(productId, count);
  }
}
