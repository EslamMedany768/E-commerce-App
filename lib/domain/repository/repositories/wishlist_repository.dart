import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/DeleteFromWishlistEntity.dart';
import 'package:e_commerce_app/domain/entities/GetWishListProduct.dart';

import '../../entities/AddToWishlistEntity.dart';

abstract class WishlistRepository {
  Future<Either<Failures, GetWishListProductsEntity>> getWishlistItems();

  Future<Either<Failures, AddToWishlistEntity>> addToWishlist(String productId);

  Future<Either<Failures, DeleteFromWishlistEntity>> deleteFromWishlist(
    String productId,
  );
}
