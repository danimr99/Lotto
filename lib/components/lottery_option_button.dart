import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LotteryOptionButton extends StatelessWidget {
  LotteryOptionButton(
      {Key key,
      this.width,
      this.height,
      this.borderRadius,
      this.color,
      this.assetName,
      this.route});

  final double width, height, borderRadius;
  final Color color;
  final String assetName;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => this.route,
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / this.width,
        height: MediaQuery.of(context).size.height / this.height,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(
            Radius.circular(this.borderRadius),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetName,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
