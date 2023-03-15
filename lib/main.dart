import 'package:calculator/circle.dart';
import 'package:calculator/view/provider_calculator.dart';
import 'package:calculator/view/state_calculator.dart';
import 'package:flutter/material.dart';

import 'view/bloc_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/SelectDesignPattern',
      routes: {
        '/SelectDesignPattern': (context) => const SelectDesignPattern(),
        '/SelectDesignPattern/BlocCalculator': (context) =>
            const BlocCalculator(),
        '/SelectDesignPattern/ProviderCalculator': (context) =>
            ProviderCalculator(),
        '/SelectDesignPattern/StateCalculator': (context) =>
            const StateCalculator()
      },
    );
  }
}

class SelectDesignPattern extends StatefulWidget {
  const SelectDesignPattern({Key? key}) : super(key: key);

  @override
  State<SelectDesignPattern> createState() => _SelectDesignPatternState();
}

class _SelectDesignPatternState extends State<SelectDesignPattern> {
  int lastValue = 0;
  List list = List.generate(400, (index) => index);
  Circle circle = Circle(19);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("area : ${circle.area}"),
            Text("radius : ${circle.radius}"),
            Text("circumference : ${circle.circumference}"),
            InkWell(
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.red,
              ),
              onTap: () {
                circle.radius += 10;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
