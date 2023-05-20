import 'package:flutter/material.dart';
import 'diceroll.dart';

class Linear extends StatelessWidget {
 const  Linear({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(192, 121, 115, 1),
            Color.fromARGB(255, 161, 213, 255)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Diceroller(),
    );
  }
}
