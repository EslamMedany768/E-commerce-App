import 'CategoryOrBrandEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({this.results, this.metadata, this.data});

  num? results;
  ProductMetadataEntity? metadata;
  List<ProductEntity>? data;
}

class ProductEntity {
  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
}


class SubcategoryEntity {
  SubcategoryEntity({this.id, this.name, this.slug, this.category});

  String? id;
  String? name;
  String? slug;
  String? category;
}

class ProductMetadataEntity {
  ProductMetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;
}
