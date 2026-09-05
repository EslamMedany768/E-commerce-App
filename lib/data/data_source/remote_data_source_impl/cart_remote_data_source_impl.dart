import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/api/api_manager.dart';
import 'package:e_commerce_app/Core/api/end_points.dart';
import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/data/model/GetCartResponseDm.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDm>> getCartItems() async {
    try {
      var connectivityResults = await Connectivity().checkConnectivity();
      if (connectivityResults.contains(ConnectivityResult.mobile) ||
          connectivityResults.contains(ConnectivityResult.wifi)) {
        var token = SharedPreferenceUtils.getData(key: "token");
        var response = await apiManager.getData(
          endPoint: EndPoints.addToCart,
          headers: {"token": token},
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(GetCartResponseDm.fromJson(response.data));
        } else {
          return Left(ServerError(errorName: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorName: "no internet connection"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDm>> deleteCartItem(
    String productId,
  ) async {
    try {
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        var pref = await SharedPreferences.getInstance();
        var token = pref.getString("token");
        var response = await apiManager.deleteData(
          productId: productId,
          headers: {"token": token},
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          var cartResponse = GetCartResponseDm.fromJson(response.data);
          return right(cartResponse);
        } else {
          return Left(ServerError(errorName: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorName: "please check your connection"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDm>> updateCartItem(
    String productId,
    int count,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var pref = await SharedPreferences.getInstance();
        var token = pref.getString("token");
        var response = await apiManager.updateData(
          productId: productId,
          headers: {"token": token},
          count: count,
        );
        var cartResponse = GetCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(GetCartResponseDm.fromJson(response.data));
        } else {
          return Left(ServerError(errorName: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorName: "Please check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }
}
