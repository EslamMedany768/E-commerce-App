import 'package:e_commerce_app/domain/entities/AddProductResponseEntity.dart';

class AddProductResponseDm extends AddProductResponseEntity {
  AddProductResponseDm({
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddProductResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataCartDm.fromJson(json['data']) : null;
  }
}

class DataCartDm extends DataCartEntity {
  DataCartDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataCartDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductDm extends AddProductEntity {
  AddProductDm({super.count, super.id, super.product, super.price});

  AddProductDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
