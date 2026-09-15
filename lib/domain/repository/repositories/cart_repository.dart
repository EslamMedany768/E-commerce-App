import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';

import '../../entities/GetCartResponseEntity.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getCartItems();
  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(String productId);
  Future<Either<Failures, GetCartResponseEntity>> updateCartItem(String productId,int count);
}
