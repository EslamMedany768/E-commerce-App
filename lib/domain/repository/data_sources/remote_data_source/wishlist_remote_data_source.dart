import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/AddToWishlistEntity.dart';

import '../../../entities/DeleteFromWishlistEntity.dart';
import '../../../entities/GetWishListProduct.dart';

abstract class WishlistRemoteDataSource {
  Future<Either<Failures, GetWishListProductsEntity>> getWishlistItems();

  Future<Either<Failures, AddToWishlistEntity>> addToWishList(String productId);

  Future<Either<Failures, DeleteFromWishlistEntity>> deleteFromWishlist(
    String productId,
  );
}
