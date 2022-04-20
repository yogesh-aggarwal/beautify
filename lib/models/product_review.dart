import 'dart:convert';

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
