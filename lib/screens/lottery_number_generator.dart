import 'package:flutter/material.dart';
import 'package:Lotto/components/number_cell.dart';
import 'dart:math';
import 'dart:core';
import 'package:Lotto/components/star_cell.dart';

class LotteryNumberGenerator extends StatefulWidget {
  LotteryNumberGenerator({this.lottery});

  final String lottery;

  @override
  _LotteryNumberGeneratorState createState() => _LotteryNumberGeneratorState();
}

class _LotteryNumberGeneratorState extends State<LotteryNumberGenerator> {
  final Random random = Random();
  final int min = 1;
  int max = 0;
  int minStars = 0;
  int maxStars = 0;
  int quantityOfNumbers = 0;
  int quantityOfStars = 0;
  List<int> finalNumber = [];
  List<int> finalStars = [];

  List getRandomLotteryNumber() {
    finalNumber.clear();

    if (this.widget.lottery == 'Euromillones') {
      this.max = 50;
      this.quantityOfNumbers = 5;
    } else if (this.widget.lottery == 'Bonoloto') {
      this.max = 49;
      this.quantityOfNumbers = 6;
    } else if (this.widget.lottery == 'Primitiva') {
      this.max = 49;
      this.quantityOfNumbers = 6;
    }

    for (int i = 0; i < this.quantityOfNumbers;) {
      int num = this.min + random.nextInt(this.max - this.min + 1);

      if (!finalNumber.contains(num)) {
        finalNumber.add(num);
        i++;
      }
    }

    finalNumber.sort();
    print(finalNumber);

    return finalNumber;
  }

  List getRandomLotteryStars() {
    finalStars.clear();

    if (this.widget.lottery == 'Euromillones') {
      this.quantityOfStars = 2;
      this.minStars = 1;
      this.maxStars = 12;
    } else if (this.widget.lottery == 'Primitiva') {
      this.quantityOfStars = 1;
      this.minStars = 0;
      this.maxStars = 9;
    }

    for (int i = 0; i < this.quantityOfStars;) {
      int star =
          this.minStars + random.nextInt(this.maxStars - this.minStars + 1);

      if (!finalStars.contains(star)) {
        finalStars.add(star);
        i++;
      }
    }

    finalStars.sort();
    print(finalStars);

    return finalStars;
  }

  List<Widget> getNumberCells() {
    List<Widget> cells = [];

    for (int i = 0; i < quantityOfNumbers; i++) {
      cells.add(
        Flexible(
          flex: 1,
          child: NumberCell(
            number: finalNumber[i].toString(),
          ),
        ),
      );
    }

    return cells;
  }

  List<Widget> getStarsCells() {
    List<Widget> stars = [];

    for (int i = 0; i < quantityOfStars; i++) {
      stars.add(Flexible(
        flex: 1,
        child: StarCell(
          lottery: this.widget.lottery,
          number: finalStars[i].toString(),
        ),
      ));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    getRandomLotteryNumber();
    getRandomLotteryStars();

    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.lottery),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 3 / 4,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: Row(
                        children: getNumberCells(),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Container(
                        child: Row(
                          children: getStarsCells(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    getRandomLotteryNumber();
                    getRandomLotteryStars();
                  });
                },
                child: Container(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Generate lottery number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
