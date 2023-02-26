import 'package:calculator/bloc/count_bloc.dart';
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
        '/SelectDesignPattern' : (context) => const SelectDesignPattern(),
        '/SelectDesignPattern/BlocCalculator' : (context) =>  const BlocCalculator(),
        '/SelectDesignPattern/ProviderCalculator' : (context) => ProviderCalculator(),
        '/SelectDesignPattern/StateCalculator' : (context) => const StateCalculator()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('마지막 결과 : $lastValue'),
            TextButton(
              onPressed: () async{
                lastValue = await Navigator.pushNamed(context, '/SelectDesignPattern/BlocCalculator') as int;
                setState(() {});
              },
              child: const Text(
                  "Bloc"
              ),
            ),
            TextButton(
              onPressed: () async{
                lastValue = await Navigator.pushNamed(context, '/SelectDesignPattern/ProviderCalculator') as int;
                setState(() {});
              },
              child: const Text(
                  "provider"
              ),
            ),
            TextButton(
              onPressed: () async{
                lastValue = await Navigator.pushNamed(context, '/SelectDesignPattern/StateCalculator') as int;
                setState(() {});
              },
              child: const Text(
                  "state"
              ),
            ),
          ],
        ),
      ),
    );
  }
}

