import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/AddToWishlistEntity.dart';
import 'package:e_commerce_app/domain/entities/DeleteFromWishlistEntity.dart';
import 'package:e_commerce_app/domain/entities/GetWishListProduct.dart';
import 'package:e_commerce_app/domain/repository/data_sources/remote_data_source/wishlist_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistRepositoryImpl({required this.wishlistRemoteDataSource});

  @override
  Future<Either<Failures, AddToWishlistEntity>> addToWishlist(
    String productId,
  ) async {
    var either = await wishlistRemoteDataSource.addToWishList(productId);
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
  Future<Either<Failures, GetWishListProductsEntity>> getWishlistItems() async {
    var either = await wishlistRemoteDataSource.getWishlistItems();
    return either.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }

  @override
  Future<Either<Failures, DeleteFromWishlistEntity>> deleteFromWishlist(
    String productId,
  ) async {
    var either = await wishlistRemoteDataSource.deleteFromWishlist(productId);
    return either.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return Right(r);
      },
    );
  }
}
