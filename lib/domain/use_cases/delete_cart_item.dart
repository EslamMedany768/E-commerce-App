import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class DeleteCartItemUseCase {
  CartRepository cartRepository;

  DeleteCartItemUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId) {
    return cartRepository.deleteCartItem(productId);
  }
}
