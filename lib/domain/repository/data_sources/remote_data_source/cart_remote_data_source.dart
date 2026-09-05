import 'package:dartz/dartz.dart';

import '../../../../Core/failures/failures.dart';
import '../../../entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures,GetCartResponseEntity>> getCartItems();
  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(String productId);
  Future<Either<Failures, GetCartResponseEntity>> updateCartItem(String productId,int count);
}