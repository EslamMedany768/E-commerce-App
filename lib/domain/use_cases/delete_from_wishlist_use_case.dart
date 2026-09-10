import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/DeleteFromWishlistEntity.dart';
import 'package:e_commerce_app/domain/repository/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFromWishlistUseCase {
  WishlistRepository wishlistRepository;

  DeleteFromWishlistUseCase({required this.wishlistRepository});

  Future<Either<Failures, DeleteFromWishlistEntity>> invoke(String productId) {
    return wishlistRepository.deleteFromWishlist(productId);
  }
}
