class AddProductResponseEntity {
  AddProductResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  DataCartEntity? data;
}

class DataCartEntity {
  DataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class AddProductEntity {
  AddProductEntity({this.count, this.id, this.product, this.price});

  num? count;
  String? id;
  String? product;
  num? price;
}
