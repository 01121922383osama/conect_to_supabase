import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  final String productId;
  final String productName;
  final String productImage;
  final num price;
  final String productDescription;

  Products({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.productDescription,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

class Bags extends Products {
  Bags({
    required super.productId,
    required super.productName,
    required super.productImage,
    required super.price,
    required super.productDescription,
  });
}

class Clothes extends Products {
  Clothes({
    required super.productId,
    required super.productName,
    required super.productImage,
    required super.price,
    required super.productDescription,
  });
}

class Shoes extends Products {
  Shoes({
    required super.productId,
    required super.productName,
    required super.productImage,
    required super.price,
    required super.productDescription,
  });
}
