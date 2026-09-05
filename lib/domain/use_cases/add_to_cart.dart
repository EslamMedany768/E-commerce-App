import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/AddProductResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddProductResponseEntity>> invoke(
     String productId,
  ) {
    return homeRepository.addToCart(productId);
  }
}
