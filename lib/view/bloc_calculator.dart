import 'package:calculator/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlocCalculator extends StatefulWidget {
  const BlocCalculator({Key? key}) : super(key: key);

  @override
  State<BlocCalculator> createState() => _BlocCalculatorState();
}

class _BlocCalculatorState extends State<BlocCalculator> {

  CountBloc countBloc = CountBloc();

  int inputNum = 0;

  @override
  void dispose() {
    countBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

      stream: countBloc.countStream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return WillPopScope(child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '결과 : ${snapshot.data}'
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    inputNum = int.parse(text);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  autofocus: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: () {
                        countBloc.addEvent(inputNum);
                      }, child: Text('+')),
                    ),
                    Expanded(
                      child: ElevatedButton(onPressed: () {
                        countBloc.subtractEvent(inputNum);
                      }, child: Text('-')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ), onWillPop: () async {
          Navigator.pop(context,snapshot.data);
          return false;
        });
      },);
  }
}
