import 'dart:convert';

import 'package:flutter/foundation.dart';

//------------------------------------------------------------------------------
//----- Product Feature --------------------------------------------------------
//------------------------------------------------------------------------------
class ProductFeature {
  final String name;
  final String icon;
  ProductFeature({
    required this.name,
    required this.icon,
  });

  ProductFeature copyWith({
    String? name,
    String? icon,
  }) {
    return ProductFeature(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'icon': icon});

    return result;
  }

  factory ProductFeature.fromMap(Map<String, dynamic> map) {
    return ProductFeature(
      name: map['name'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductFeature.fromJson(String source) =>
      ProductFeature.fromMap(json.decode(source));

  @override
  String toString() => 'ProductFeature(name: $name, icon: $icon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductFeature && other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}

//------------------------------------------------------------------------------
//----- Product Review ---------------------------------------------------------
//------------------------------------------------------------------------------
class ProductReview {
  final String userID;
  final int star;
  final String content;
  ProductReview({
    required this.userID,
    required this.star,
    required this.content,
  });

  ProductReview copyWith({
    String? userID,
    int? star,
    String? content,
  }) {
    return ProductReview(
      userID: userID ?? this.userID,
      star: star ?? this.star,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userID': userID});
    result.addAll({'star': star});
    result.addAll({'content': content});

    return result;
  }

  factory ProductReview.fromMap(Map<String, dynamic> map) {
    return ProductReview(
      userID: map['userID'] ?? '',
      star: map['star']?.toInt() ?? 0,
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductReview.fromJson(String source) =>
      ProductReview.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductReview(userID: $userID, star: $star, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductReview &&
        other.userID == userID &&
        other.star == star &&
        other.content == content;
  }

  @override
  int get hashCode => userID.hashCode ^ star.hashCode ^ content.hashCode;
}

//------------------------------------------------------------------------------
//----- Product ----------------------------------------------------------------
//------------------------------------------------------------------------------
class Product {
  final String id;
  final String name;
  final String tagline;
  final double price;
  final int stars;
  final List<ProductReview> reviews;
  final List<String> images;
  final List<ProductFeature> features;
  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.price,
    required this.stars,
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
    return 'Product(id: $id, name: $name, tagline: $tagline, price: $price, stars: $stars, reviews: $reviews, images: $images, features: $features)';
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
        reviews.hashCode ^
        images.hashCode ^
        features.hashCode;
  }
}
