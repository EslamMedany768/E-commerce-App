import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/AddToWishlistEntity.dart';
import 'package:e_commerce_app/domain/repository/data_sources/remote_data_source/wishlist_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishlistUseCase {
  WishlistRepository wishlistRepository;

  AddToWishlistUseCase({required this.wishlistRepository});

  Future<Either<Failures, AddToWishlistEntity>> invoke(String productId) {
   return wishlistRepository.addToWishlist(productId);
  }
}
