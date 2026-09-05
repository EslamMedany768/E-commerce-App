import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/api/api_manager.dart';
import 'package:e_commerce_app/Core/api/end_points.dart';
import 'package:e_commerce_app/Core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/data/model/AddProductResponseDm.dart';
import 'package:e_commerce_app/data/model/CategoryOrBrandDm.dart';
import 'package:e_commerce_app/data/model/ProductResponseDm.dart';
import 'package:e_commerce_app/domain/entities/AddProductResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllCategories() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllCategory,
        );
        var categoryResponse = await CategoryOrBrandResponseDm.fromJson(
          response.data,
        );

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorName: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(errorName: "Please Check Your Internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllBrands() async {
    try {
      var connectionResults = await Connectivity().checkConnectivity();

      if (connectionResults.contains(ConnectivityResult.wifi) ||
          connectionResults.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllBrands,
        );
        var brandResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorName: brandResponse.statusMsg!));
        }
      } else {
        return Left(NetworkError(errorName: "Please Check Your Internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts() async {
    try {
      var connectivityResults = await Connectivity().checkConnectivity();
      if (connectivityResults.contains(ConnectivityResult.mobile) ||
          connectivityResults.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(
          endPoint: EndPoints.getAllProducts,
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(ProductResponseDm.fromJson(response.data));
        } else {
          return Left(ServerError(errorName: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorName: "please Check your Internet"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddProductResponseDm>> addToCart(
    String productId,
  ) async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferenceUtils.getData(key: "token");
        var response = await apiManager.postData(
          endPoint: EndPoints.addToCart,
          headers: {"token": token},
          body: {"productId": productId},
        );
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          var addProductResponse = AddProductResponseDm.fromJson(response.data);
          return Right(addProductResponse);
        } else {
          return Left(ServerError(errorName: response.statusMessage!));
        }
      } else {
        return Left(NetworkError(errorName: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failures(errorName: e.toString()));
    }
  }
}
