import 'package:beautify/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  navigateToHomePage(BuildContext context) {}

  Widget _buildBody(BuildContext context) {
    return BeautifyBody(
      hPadding: 4.0,
      child: SizedBox.fromSize(
        size: Size.fromHeight(MediaQuery.of(context).size.height),
        child: [
          SizedBox.square(
            dimension: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/intro.png",
              fit: BoxFit.contain,
            ),
          ),
          [
            "Let Us Reward".text.size(38).medium.make(),
            [
              "You,".text.size(38).medium.make().pOnly(right: 6),
              "Naturally!!".text.size(38).bold.make(),
            ].hStack().pOnly(top: 10),
          ].vStack().pOnly(top: 30, bottom: 50),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 30,
          ).p(25).box.border(color: Colors.black, width: 2.0).roundedLg.make(),
        ].vStack(
          axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}
