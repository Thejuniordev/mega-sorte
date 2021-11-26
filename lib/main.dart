import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mega_sorte/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/lucky_icon.png'),
                width: 120,
                height: 50,
              ),
              Text(
                'Mega Sorte',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        nextScreen: const MyHomePage(
          title: 'Meus números da sorte',
        ),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String randomNumber = 'X';
  @override
  Widget build(BuildContext context) {
    final list = nextNumbers(6, min: 1, max: 60);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/lucky_icon.png'),
              width: 180,
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              'Confira aqui seus números da sorte',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '$list',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            randomNumber = Random().nextInt(999999).toString().padLeft(12, ' ');
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  int nextNumber({required int min, required int max}) =>
      min + Random().nextInt(max - min + 1);

  List<int> nextNumbers(int length, {required int min, required int max}) {
    final numbers = Set<int>();

    while (numbers.length < length) {
      final number = nextNumber(min: min, max: max);
      numbers.add(number);
    }
    return List.of(numbers);
  }
}
