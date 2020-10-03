import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OptionButton extends StatelessWidget {
  OptionButton(
      {Key key,
      this.width,
      this.height,
      this.color,
      this.borderRadius,
      this.label,
      this.icon,
      this.iconSize,
      this.iconColor,
      this.route});

  final double width, height, borderRadius, iconSize;
  final Color color, iconColor;
  final String label;
  final IconData icon;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              this.icon != null
                  ? FaIcon(
                      this.icon,
                      size: this.iconSize,
                      color: this.iconColor,
                    )
                  : Container(),
              this.icon != null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    )
                  : Container(),
              Text(
                this.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
