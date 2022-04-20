import 'package:beautify/widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  PreferredSize _buildAppBar(BuildContext context) {
    return BeautifyAppBar(
      context: context,
      height: 140,
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
    return "Hello Home".text.make();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
}
