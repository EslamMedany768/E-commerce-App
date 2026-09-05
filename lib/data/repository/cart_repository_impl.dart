import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../Core/failures/failures.dart';
import '../../domain/entities/GetCartResponseEntity.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCartItems() async {
    var either = await cartRemoteDataSource.getCartItems();
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
    String productId,
  ) async {
    var either = await cartRemoteDataSource.deleteCartItem(productId);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCartItem(
    String productId,int count
  ) async {
    var either = await cartRemoteDataSource.updateCartItem(productId,count);
    return either.fold(
      (error) {
        return Left(error);
      },
      (response) {
        return Right(response);
      },
    );
  }
}
