import 'package:e_commerce_app/domain/entities/DeleteFromWishlistEntity.dart';

class DeleteFromWishlistDm extends DeleteFromWishlistEntity {
  DeleteFromWishlistDm({super.status, super.message, super.data});

  DeleteFromWishlistDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
}
