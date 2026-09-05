
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddProductResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

import '../../../../Core/failures/failures.dart';
import '../../../entities/CategoryOrBrandEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
  Future<Either<Failures,AddProductResponseEntity>> addToCart(String productId);
}
