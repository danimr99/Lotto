import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Lotto/components/option_button.dart';
import 'package:Lotto/screens/number_generator.dart';
import 'package:Lotto/screens/lottery_menu_selector.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionButton(
                  width: 1.25,
                  height: 3,
                  color: Colors.blue,
                  borderRadius: 16.0,
                  label: 'Generate a random number',
                  icon: FontAwesomeIcons.dice,
                  iconSize: 60.0,
                  iconColor: Colors.white,
                  route: NumberGenerator(),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionButton(
                  width: 1.25,
                  height: 3,
                  color: Colors.red,
                  borderRadius: 16.0,
                  label: 'Generate a random lottery number',
                  icon: FontAwesomeIcons.ticketAlt,
                  iconSize: 60.0,
                  iconColor: Colors.white,
                  route: LotteryMenuSelector(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
