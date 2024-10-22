import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
