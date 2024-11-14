import 'dart:math';

import 'package:dashboard_ecommerce_app/constants/bags.dart';
import 'package:dashboard_ecommerce_app/constants/clothes.dart';
import 'package:dashboard_ecommerce_app/constants/shoes.dart';
import 'package:dashboard_ecommerce_app/models/products.dart';
import 'package:uuid/uuid.dart';

final List<Bags> productBags = List.generate(
  10,
  (index) {
    final List<String> images = [
      BagsAssets.assetsBagsBag1,
      BagsAssets.assetsBagsBag2,
      BagsAssets.assetsBagsBag3,
      BagsAssets.assetsBagsBag4,
      BagsAssets.assetsBagsBag5,
      BagsAssets.assetsBagsBag6,
      BagsAssets.assetsBagsBag7,
      BagsAssets.assetsBagsBag8,
      BagsAssets.assetsBagsBag9,
      BagsAssets.assetsBagsBag10
    ];
    return Bags(
      productId: const Uuid().v4(),
      productName: 'Bag ${index + 1}',
      productImage: images[index],
      price: Random().nextInt(1000).toDouble(),
      productDescription: 'Description ${index + 1}',
    );
  },
);
final List<Shoes> productShoes = List.generate(
  9,
  (index) {
    final List<String> images = [
      ShoesAssets.assetsShoesBrownShoes,
      ShoesAssets.assetsShoesCartonShoes,
      ShoesAssets.assetsShoesDarkShoes,
      ShoesAssets.assetsShoesGreenShose,
      ShoesAssets.assetsShoesOxfordShoes,
      ShoesAssets.assetsShoesRedShose,
      ShoesAssets.assetsShoesShoes,
      ShoesAssets.assetsShoesTealShoes,
      ShoesAssets.assetsShoesWhteShose,
    ];
    return Shoes(
      productId: const Uuid().v4(),
      productName: 'Shoes ${index + 1}',
      productImage: images[index],
      price: Random().nextInt(1000).toDouble(),
      productDescription: 'Description ${index + 1}',
    );
  },
);
final List<Clothes> productClothes = List.generate(
  10,
  (index) {
    final List<String> images = [
      ClothesAssets.assetsClothesBlackJacket,
      ClothesAssets.assetsClothesBluejacket,
      ClothesAssets.assetsClothesDress,
      ClothesAssets.assetsClothesGreenDress,
      ClothesAssets.assetsClothesGreenShirt,
      ClothesAssets.assetsClothesJacket,
      ClothesAssets.assetsClothesListShirt,
      ClothesAssets.assetsClothesShirt,
      ClothesAssets.assetsClothesSuit,
      ClothesAssets.assetsClothesWhiteShirt,
    ];
    return Clothes(
      productId: const Uuid().v4(),
      productName: 'Clothes ${index + 1}',
      productImage: images[index],
      price: Random().nextInt(1000).toDouble(),
      productDescription: 'Description ${index + 1}',
    );
  },
);
