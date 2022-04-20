import 'dart:convert';

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

typedef ProductFeatures = List<ProductFeature>;
