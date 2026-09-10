import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/api/api_manager.dart';
import 'package:e_commerce_app/Core/api/end_points.dart';
import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/data/model/AddToWishlistDm.dart';
import 'package:e_commerce_app/data/model/DeleteFromWishlistDm.dart';
import 'package:e_commerce_app/data/model/GetWishListProductsDm.dart';
import 'package:e_commerce_app/domain/entities/DeleteFromWishlistEntity.dart';
import 'package:e_commerce_app/domain/entities/GetWishListProduct.dart';
import 'package:e_commerce_app/domain/repository/data_sources/remote_data_source/wishlist_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../Core/failures/failures.dart';
import '../../../domain/entities/AddToWishlistEntity.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  ApiManager apiManager;

  WishlistRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AddToWishlistDm>> addToWishList(
    String productId,
  ) async {
    try {
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.addToWishlist,
          body: {"productId": productId},
          headers: {"token": SharedPreferenceUtils.getData(key: "token")},
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(AddToWishlistDm.fromJson(response.data));
        } else {
          return Left(
            ServerError(errorName: "status code is :${response.statusCode}"),
          );
        }
      } else {
        return Left(NetworkError(errorName: "please check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetWishListProductsDm>> getWishlistItems() async {
    try {
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.mobile) ||
          connectionResult.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          headers: {"token": SharedPreferenceUtils.getData(key: "token")},
          endPoint: EndPoints.getWishlistItems,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(GetWishListProductsDm.fromJson(response.data));
        } else {
          return Left(ServerError(errorName: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorName: "please check your internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, DeleteFromWishlistDm>> deleteFromWishlist(
    String productId,
  ) async {
    try {
      String token=SharedPreferenceUtils.getData(key: "token");
      var connectionResult = await Connectivity().checkConnectivity();
      if (connectionResult.contains(ConnectivityResult.wifi) ||
          connectionResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.deleteData(
          EndPoint: EndPoints.deleteWishlistItems,
          productId: productId,
          headers: {"token": token},
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(DeleteFromWishlistDm.fromJson(response.data));
        } else {
          print(response.statusCode);
          print(DeleteFromWishlistDm.fromJson(response.data).message!);
          return Left(
            ServerError(
              errorName: DeleteFromWishlistDm.fromJson(response.data).message!,
            ),
          );
        }
      } else {
        return Left(NetworkError(errorName: "Please check your internet"));
      }
    } catch (e) {
      print(e.toString());
      return Left(Failures(errorName: e.toString()));
    }
  }
}
