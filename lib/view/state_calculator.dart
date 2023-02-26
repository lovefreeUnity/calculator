import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StateCalculator extends StatefulWidget {
  const StateCalculator({Key? key}) : super(key: key);

  @override
  State<StateCalculator> createState() => _StateCalculatorState();
}

class _StateCalculatorState extends State<StateCalculator> {
  int value = 0;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$value',
                ),
                TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            value += int.parse(textEditingController.text);
                            setState(() {});
                          },
                          child: Text('+')),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            value -= int.parse(textEditingController.text);
                            setState(() {});
                          },
                          child: Text('-')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.pop(context, value);
          return false;
        });
  }
}
