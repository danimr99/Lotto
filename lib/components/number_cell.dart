import 'package:flutter/material.dart';

class NumberCell extends StatefulWidget {
  NumberCell({this.number});

  final String number;

  @override
  _NumberCellState createState() => _NumberCellState();
}

class _NumberCellState extends State<NumberCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          this.widget.number,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
