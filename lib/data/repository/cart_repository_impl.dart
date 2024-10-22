import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/data/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app_route/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';
import 'package:e_commerce_app_route/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    // TODO: implement deleteItemInCart
    var either = await cartRemoteDataSource.deleteItemInCart(productId);
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    // TODO: implement updateCountInCart
    var either = await cartRemoteDataSource.updateCountInCart(productId, count);
    return either.fold((l) => Left(l), (response) => Right(response));
  }
}
