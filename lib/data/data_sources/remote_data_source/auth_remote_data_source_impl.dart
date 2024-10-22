import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/data/api_manager.dart';
import 'package:e_commerce_app_route/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app_route/data/end_points.dart';
import 'package:e_commerce_app_route/data/model/LoginResponseDM.dart';
import 'package:e_commerce_app_route/data/model/RegisterResponseDM.dart';
import 'package:e_commerce_app_route/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app_route/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        // internet
        var response = await apiManager.postData(EndPoints.register,
            body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(registerResponse);
        }else{
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDto>> login(String email, String password)async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        // internet
        var response = await apiManager.postData(EndPoints.login,
            body: {
              "email":email,
              "password":password
            });
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          //todo: save token
          //SharedPreferenceUtils.saveData(key: 'token', value: loginResponse.token);
          return Right(loginResponse);
        }else{
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    }catch(e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
