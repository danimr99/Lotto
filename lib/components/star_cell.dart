import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarCell extends StatefulWidget {
  StarCell({this.lottery, this.number});

  final String lottery, number;

  @override
  _StarCellState createState() => _StarCellState();
}

class _StarCellState extends State<StarCell> {
  @override
  Widget build(BuildContext context) {
    Widget star;

    if (this.widget.lottery == 'Euromillones') {
      star = Stack(
        children: [
          Center(
            child: FaIcon(
              FontAwesomeIcons.star,
              color: Colors.yellow,
              size: 100.0,
            ),
          ),
          Center(
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
        ],
      );
    } else if (this.widget.lottery == 'Primitiva') {
      star = Container(
        child: Center(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  'Refund',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  this.widget.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return star;
  }
}
