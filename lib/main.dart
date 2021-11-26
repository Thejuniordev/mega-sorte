import 'package:flutter/material.dart';
import 'dart:math';

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
      home: const MyHomePage(title: 'Meus números da sorte'),
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
