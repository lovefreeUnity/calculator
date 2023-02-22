import 'package:calculator/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProviderCalculator extends StatelessWidget {
  ProviderCalculator({Key? key}) : super(key: key);

  int inputNum = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      builder: (context,child){
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('결과 : ${Provider.of<CountProvider>(context).countNumber}'),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    const AsyncSnapshot.waiting();
                    inputNum = int.parse(text);
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Provider.of<CountProvider>(context)
                                .addEvent(inputNum);
                          },
                          child: Text('+')),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Provider.of<CountProvider>(context)
                                .subtractEvent(inputNum);
                          },
                          child: Text('-')),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
