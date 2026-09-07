import 'package:e_commerce_app/domain/entities/AddToWishlistEntity.dart';

class AddToWishlistDm extends AddToWishlistEntity{
  AddToWishlistDm({
      super.status,
    super.message,
    super.data,});

  AddToWishlistDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}