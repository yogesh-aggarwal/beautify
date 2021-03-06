import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:beautify/core/store.dart';
import 'package:beautify/models/product_feature.dart';
import 'package:beautify/models/product_review.dart';

class Product {
  final String id;
  final String name;
  final String tagline;
  final double price;
  final int stars;
  final double volume;
  final List<ProductReview> reviews;
  final List<String> images;
  final List<ProductFeature> features;
  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.price,
    required this.stars,
    required this.volume,
    required this.reviews,
    required this.images,
    required this.features,
  });

  Product copyWith({
    String? id,
    String? name,
    String? tagline,
    double? price,
    int? stars,
    double? volume,
    List<ProductReview>? reviews,
    List<String>? images,
    List<ProductFeature>? features,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      price: price ?? this.price,
      stars: stars ?? this.stars,
      volume: volume ?? this.volume,
      reviews: reviews ?? this.reviews,
      images: images ?? this.images,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'tagline': tagline});
    result.addAll({'price': price});
    result.addAll({'stars': stars});
    result.addAll({'volume': volume});
    result.addAll({'reviews': reviews.map((x) => x.toMap()).toList()});
    result.addAll({'images': images});
    result.addAll({'features': features.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      tagline: map['tagline'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      stars: map['stars']?.toInt() ?? 0,
      volume: map['volume']?.toDouble() ?? 0.0,
      reviews: List<ProductReview>.from(
          map['reviews']?.map((x) => ProductReview.fromMap(x))),
      images: List<String>.from(map['images']),
      features: List<ProductFeature>.from(
          map['features']?.map((x) => ProductFeature.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, name: $name, tagline: $tagline, price: $price, stars: $stars, volume: $volume, reviews: $reviews, images: $images, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.tagline == tagline &&
        other.price == price &&
        other.stars == stars &&
        other.volume == volume &&
        listEquals(other.reviews, reviews) &&
        listEquals(other.images, images) &&
        listEquals(other.features, features);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        tagline.hashCode ^
        price.hashCode ^
        stars.hashCode ^
        volume.hashCode ^
        reviews.hashCode ^
        images.hashCode ^
        features.hashCode;
  }
}

typedef Products = List<Product>;

class UpdateProducts extends VxMutation<GStore> {
  @override
  perform() async {
    List<dynamic> products = json.decode(
      await rootBundle.loadString('assets/data.json'),
    )["products"];

    Products finalProducts = [];
    for (var product in products) {
      finalProducts.add(Product.fromMap(product));
    }

    VxState.store?.products = finalProducts;
  }
}
