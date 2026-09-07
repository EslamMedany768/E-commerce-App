import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/api/api_manager.dart';
import 'package:e_commerce_app/Core/api/end_points.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/data/model/LoginResponseDM.dart';
import 'package:e_commerce_app/data/model/RegisterResponseDM.dart';
import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        var response = await apiManager.postData(
          endPoint: EndPoints.signUp,
          body: {"name": name, "email": email, "password": password, "rePassword": rePassword, "phone": phone},
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorName: registerResponse.message!));
        }
      } catch (e) {
        return Left(ServerError(errorName: e.toString()));
      }
    } else {
      return Left(NetworkError(errorName: "No Internet Connection,Please Check Your Internet"));
    }
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.postData(
          endPoint: EndPoints.signIn,
          body: {"email": email, "password": password},
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorName: loginResponse.message!));
        }
      } catch (e) {
        return Left(ServerError(errorName: e.toString()));
      }
    } else {
      return Left(NetworkError(errorName: "No Internet Connection,Please Check Your Internet"));
    }
  }
}
