import 'package:beautify/models/product.dart';
import 'package:beautify/widgets/appbar.dart';
import 'package:beautify/widgets/body.dart';
import 'package:beautify/widgets/product_card.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  PreferredSize _buildAppBar(BuildContext context) {
    return BeautifyAppBar(
      context: context,
      height: 150,
      child: [
        [
          SizedBox.square(
            dimension: 45,
            child: Image.network("https://bit.ly/36uA0t1").cornerRadius(10),
          ),
          [
            Icon(Icons.search, size: 30).pOnly(right: 16),
            Icon(Icons.keyboard_option_key, size: 30),
          ].hStack(),
        ]
            .hStack(
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceBetween,
              crossAlignment: CrossAxisAlignment.center,
            )
            .p20(),
        [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
            child: "Face".text.size(25).bold.make().pOnly(bottom: 1),
          ).pOnly(right: 50),
          "Body".text.xl.make().pOnly(right: 60),
          "Hair".text.xl.make().pOnly(right: 60),
          "Gifts".text.xl.make().pOnly(right: 60),
        ].hStack().pOnly(left: 20).scrollHorizontal().pOnly(top: 10),
      ].vStack(crossAlignment: CrossAxisAlignment.start),
    );
  }

  Widget _buildBody(BuildContext context) {
    VxState.watch(context, on: [UpdateProducts]);

    return BeautifyBody(
      hPadding: 0,
      child: [
        [
          for (Product product in VxState.store?.products)
            ProductCardWiget(product: product),
        ].hStack().px8().scrollHorizontal(),
        [
          "Popular".text.xl2.bold.make().pOnly(top: 30, bottom: 20),
          for (Product product in VxState.store?.products)
            Stack(
              children: [
                [
                  SizedBox.square(
                    dimension: 70,
                    child: Image.network(product.images[0], fit: BoxFit.cover),
                  ).cornerRadius(15).pOnly(right: 16),
                  [
                    product.name.text.xl.bold.make(),
                    product.tagline.text
                        .size(13)
                        .bold
                        .color(
                            Theme.of(context).textTheme.caption?.color as Color)
                        .make()
                        .pOnly(top: 3, bottom: 7),
                  ].vStack(
                    axisSize: MainAxisSize.max,
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.start,
                  ),
                ].hStack(axisSize: MainAxisSize.max),
                Positioned(
                  top: 0,
                  right: 0,
                  child: "\$${product.price}"
                      .text
                      .xl
                      .bold
                      .make()
                      .centered()
                      .pOnly(top: 15),
                )
              ],
            ).pOnly(bottom: 30),
        ].vStack(crossAlignment: CrossAxisAlignment.start).px20(),
      ].vStack(crossAlignment: CrossAxisAlignment.start),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
}
