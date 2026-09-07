import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

class GetWishListProductsEntity {
  GetWishListProductsEntity({
    this.status,
    this.count,
    this.data,});

  String? status;
  num? count;
  List<FavProductsEntity>? data;


}

class FavProductsEntity extends ProductEntity {
  FavProductsEntity({super.brand, super.category,
    super.createdAt, super.description, super.id, super.imageCover, super.images, super.price, super.quantity, super.ratingsAverage, super.ratingsQuantity, super.slug, super.sold, super.subcategory, super.title, super.updatedAt});
}

