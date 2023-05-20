import 'package:flutter/material.dart';
import 'linear.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 202, 202),
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 57, 55, 56),
              ),
              onPressed: () {
                // Handle menu button press
              },
            ),
            title: const Text(
              'Ludo App',
              style: TextStyle(color: Color.fromARGB(255, 57, 55, 56)),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Color.fromARGB(255, 57, 55, 56),
                ),
                onPressed: () {
                  // Handle notifications button press
                },
              ),
            ],
          ),
          body: const Linear(),
        ));
  }
}
