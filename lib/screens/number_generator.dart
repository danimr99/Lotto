import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:Lotto/components/number_option_button.dart';

class NumberGenerator extends StatefulWidget {
  @override
  _NumberGeneratorState createState() => _NumberGeneratorState();
}

class _NumberGeneratorState extends State<NumberGenerator> {
  final Random random = Random();
  int number;
  int min = 0;
  int max = 0;

  int getRandomNumber() {
    if (this.min != null && this.max != null) {
      number = this.min + random.nextInt(this.max - this.min + 1);

      print(number);
    }

    return number;
  }

  void settingModalBottomSheet(context, isMin) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 20,
                    horizontal: MediaQuery.of(context).size.width / 10,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Enter a number",
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (isMin) {
                          this.min = int.parse(value);
                        } else {
                          this.max = int.parse(value);
                        }
                      });
                    },
                  ),
                ),
                RaisedButton(
                  elevation: 8.0,
                  color: Colors.blue,
                  child: Text(
                    'Accept',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Random number'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.3,
            child: Center(
                child: this.number != null
                    ? Text(
                        this.number.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0,
                        ),
                      )
                    : Text(
                        'Set up a minimum and a maximum number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                      )),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        getRandomNumber();
                      });
                    },
                    child: NumberOptionButton(
                      isNumber: false,
                      label: 'Generate number',
                      icon: FontAwesomeIcons.dice,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      settingModalBottomSheet(context, true);
                    },
                    child: NumberOptionButton(
                      isNumber: true,
                      label: 'Minimum',
                      color: Colors.blue,
                      number: this.min,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      settingModalBottomSheet(context, false);
                    },
                    child: NumberOptionButton(
                      isNumber: true,
                      label: 'Maximum',
                      color: Colors.blue,
                      number: this.max,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
