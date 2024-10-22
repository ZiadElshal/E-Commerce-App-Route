import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app_route/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app_route/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';

abstract class HomeRepository{
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}