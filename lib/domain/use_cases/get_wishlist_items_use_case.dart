import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/GetWishListProduct.dart';
import 'package:e_commerce_app/domain/repository/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishlistItemsUseCase {
  WishlistRepository wishlistRepository;

  GetWishlistItemsUseCase({required this.wishlistRepository});

  Future<Either<Failures, GetWishListProductsEntity>> invoke() {
    return wishlistRepository.getWishlistItems();
  }
}
