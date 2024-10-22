import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';
import 'package:e_commerce_app_route/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase{
  HomeRepository homeRepository ;
  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures,CategoryOrBrandResponseEntity>> invoke(){
    return homeRepository.getAllBrands();
  }
}