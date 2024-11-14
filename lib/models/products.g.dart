// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productImage: json['productImage'] as String,
      price: json['price'] as num,
      productDescription: json['productDescription'] as String,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'price': instance.price,
      'productDescription': instance.productDescription,
    };
