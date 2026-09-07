import 'package:e_commerce_app/domain/entities/GetWishListProduct.dart';

class GetWishListProductsDm extends GetWishListProductsEntity{
  GetWishListProductsDm({
      super.status,
    super.count,
    super.data,});

  GetWishListProductsDm.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavProductsDm.fromJson(v));
      });
    }
  }


}

class FavProductsDm extends FavProductsEntity{
  FavProductsDm({
      super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    });

  FavProductsDm.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];

    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];

    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

    id = json['id'];
  }



}



