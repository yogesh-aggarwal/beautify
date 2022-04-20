import 'package:velocity_x/velocity_x.dart';

import 'package:beautify/models/product.dart';

// GStore = Global Store
class GStore extends VxStore {
  Products products = [
    Product(
      id: "1",
      name: "Facial Cleanser",
      tagline: "Citrus Refreshnes senses",
      price: 9.99,
      stars: 7,
      reviews: [],
      images: ["http://bit.ly/3uWgsXF"],
      features: [],
      volume: 125,
    )
  ];
}
