import 'package:flutter/material.dart';
import 'package:Lotto/components/lottery_option_button.dart';
import 'package:Lotto/screens/lottery_number_generator.dart';

class LotteryMenuSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random lottery number'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LotteryOptionButton(
                width: 1.25,
                height: 7.5,
                borderRadius: 16.0,
                color: Colors.red,
                assetName: 'assets/bonoloto.svg',
                route: LotteryNumberGenerator(
                  lottery: 'Bonoloto',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              LotteryOptionButton(
                width: 1.25,
                height: 7.5,
                borderRadius: 16.0,
                color: Colors.red,
                assetName: 'assets/euromillones.svg',
                route: LotteryNumberGenerator(
                  lottery: 'Euromillones',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              LotteryOptionButton(
                width: 1.25,
                height: 7.5,
                borderRadius: 16.0,
                color: Colors.red,
                assetName: 'assets/primitiva.svg',
                route: LotteryNumberGenerator(
                  lottery: 'Primitiva',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
