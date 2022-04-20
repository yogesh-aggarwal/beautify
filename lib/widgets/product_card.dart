import 'package:beautify/models/product.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductCardWiget extends StatelessWidget {
  final Product product;

  const ProductCardWiget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Image.network(
        product.images[0],
        fit: BoxFit.cover,
      ).cornerRadius(30).expand(),
      [
        product.name.text.xl2.bold.make(),
        product.tagline.text.bold
            .color(Theme.of(context).textTheme.caption?.color as Color)
            .make()
            .pOnly(top: 3, bottom: 15),
        "\$${product.price}".text.size(25).bold.make(),
      ].vStack(crossAlignment: CrossAxisAlignment.start).pOnly(top: 20),
    ]
        .vStack(crossAlignment: CrossAxisAlignment.start)
        .box
        .p20
        .white
        .roundedLg
        .width(MediaQuery.of(context).size.width * .6)
        .height(MediaQuery.of(context).size.height * .5)
        .make()
        .px12();
  }
}
