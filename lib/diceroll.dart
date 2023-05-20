import "package:flutter/material.dart";
import 'dart:math';

class Diceroller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _diceroll();
  }
}

class _diceroll extends State<Diceroller> {
  var activeImage = "assets/img/dice-1.png";
  var score = 0;
  var prevroller = -1;
  var consecutiveRolls = 0;
  var rollCounter = 0;

  void diceroller() {
    setState(() {
      var roller = Random().nextInt(6) + 1;
      activeImage = "assets/img/dice-$roller.png";

      if (roller == prevroller) {
        consecutiveRolls++;
        if (consecutiveRolls >= 2) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Congratulations!'),
                content: Image.asset("assets/img/woon.png"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      reset();
                    },
                    child: Text('Play Again'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        consecutiveRolls = 0;
      }

      score += roller;
      rollCounter++;

      if (consecutiveRolls == 0 && rollCounter >= 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return  AlertDialog(
              title: const Text('Game Over'),
              content: const Text('You lost the game🥴!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    reset();
                  },
                
                  child: Text('Play Again'),
                  
                ),
              ],
            );
          },
        );
      }

      prevroller = roller; // Update the previous roll value
    });
  }



  void reset() {
    setState(() {
      score = 0;
        score = 0;
      prevroller = -1;
      consecutiveRolls = 0;
      rollCounter = 0;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            activeImage,
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: diceroller,
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: const Color.fromARGB(255, 236, 169, 186),
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text(
                "Roll Dice",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 9, 9, 9)),
              )),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child: Text(
              " Score: $score ",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 59, 55, 55)),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            clipBehavior: Clip.antiAlias,
              onPressed: reset,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                shadowColor: const Color.fromARGB(0, 253, 213, 213),
                  backgroundColor:const Color.fromARGB(255, 152, 178, 205)),
              child:const Text("Reset",
              style: TextStyle(color:  Color.fromARGB(255, 45, 43, 43),
              fontSize: 20,
              fontWeight: FontWeight.normal),))
        ],
      ),
      
    );
  }
}
