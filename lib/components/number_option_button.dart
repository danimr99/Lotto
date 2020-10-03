import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumberOptionButton extends StatelessWidget {
  NumberOptionButton(
      {this.isNumber, this.label, this.icon, this.number = 0, this.color});

  final bool isNumber;
  final String label;
  final IconData icon;
  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                this.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          this.isNumber == true
              ? Expanded(
                  child: Text(
                    this.number == null ? '0' : this.number.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
          this.icon != null
              ? Expanded(
                  child: FaIcon(
                    this.icon,
                    color: Colors.white,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
