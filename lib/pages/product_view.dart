import 'package:beautify/models/product.dart';
import 'package:beautify/models/product_feature.dart';
import 'package:beautify/widgets/appbar.dart';
import 'package:beautify/widgets/body.dart';
import 'package:beautify/widgets/bottombar.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartQuantityAction extends StatelessWidget {
  final String name;

  const CartQuantityAction({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return name.text.bold.make().px(15).py8().box.roundedFull.make();
  }
}

class ProductFeatureWidget extends StatelessWidget {
  final ProductFeature feature;

  const ProductFeatureWidget({Key? key, required this.feature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      Container(),
      feature.name.text
          .size(14)
          .bold
          .color(Theme.of(context).textTheme.caption?.color as Color)
          .make()
          .pOnly(top: 6),
    ]
        .vStack()
        .p20()
        .box
        .width(MediaQuery.of(context).size.width * .25)
        .height(MediaQuery.of(context).size.width * .25)
        .white
        .roundedLg
        .make();
  }
}

class ProductViewPage extends StatelessWidget {
  final Product product = VxState.store?.products[0] as Product;

  ProductViewPage({Key? key}) : super(key: key);

  PreferredSize _buildAppBar(BuildContext context) {
    return BeautifyAppBar(
      context: context,
      height: 50,
      child: [
        Icon(Icons.arrow_back_ios, size: 28),
        Icon(Icons.keyboard_command_key_outlined, size: 28),
      ]
          .hStack(
            axisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.spaceBetween,
          )
          .pOnly(top: 20)
          .px20(),
    );
  }

  PreferredSize _buildBottomAppBar(BuildContext context) {
    return BeautifyBottomAppBar(
      context: context,
      height: 250,
      child: Container(
        padding: Vx.mSymmetric(v: 40, h: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: [
          [
            [
              product.name.text.xl2.bold.make(),
              // Stars
              [
                for (int i = 0; i < (product.stars / 2).truncate(); ++i)
                  Icon(Icons.star),
                if ((product.stars / 2) - (product.stars / 2).truncate() == 0.5)
                  Icon(Icons.star_half_outlined),
                for (int i = 0; i < (10 - product.stars + 1) / 2 - 1; ++i)
                  Icon(Icons.star_outline),
              ].hStack(),
            ].hStack(
              alignment: MainAxisAlignment.spaceBetween,
              axisSize: MainAxisSize.max,
            ),
            [
              "${product.volume}ml"
                  .text
                  .size(14)
                  .bold
                  .color(Theme.of(context).textTheme.caption?.color as Color)
                  .make()
                  .pOnly(top: 6),
              "(${product.reviews.length} Reviews)"
                  .text
                  .size(14)
                  .bold
                  .color(Theme.of(context).textTheme.caption?.color as Color)
                  .make()
                  .pOnly(top: 6),
            ].hStack(
              alignment: MainAxisAlignment.spaceBetween,
              axisSize: MainAxisSize.max,
            ),
          ].vStack(),
          [
            "\$${product.price}".text.bold.xl4.make(),
            [
              [
                CartQuantityAction(name: "-"),
                "1".text.bold.make().px(10).py8(),
                CartQuantityAction(name: "+"),
              ]
                  .hStack()
                  .box
                  .withRounded(value: 20)
                  .border(color: Colors.grey)
                  .make()
                  .pOnly(right: 20),
              "Cart"
                  .text
                  .white
                  .bold
                  .xl
                  .make()
                  .pSymmetric(h: 28, v: 20)
                  .box
                  .black
                  .withRounded(value: 20)
                  .make(),
            ].hStack(),
          ]
              .hStack(
                alignment: MainAxisAlignment.spaceBetween,
                axisSize: MainAxisSize.max,
              )
              .pOnly(top: 40),
        ].vStack(crossAlignment: CrossAxisAlignment.start),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BeautifyBody(
      hPadding: 0,
      vPadding: 0,
      child: [
        SizedBox.square(
          dimension: MediaQuery.of(context).size.width,
          child: Image.network(product.images[0]),
        ),
        [
          for (var feature in product.features)
            ProductFeatureWidget(feature: feature),
          ProductFeatureWidget(feature: ProductFeature(icon: "", name: "")),
        ]
            .hStack(
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceBetween,
            )
            .p20(),
      ].vStack(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: _buildBody(context),
    );
  }
}
