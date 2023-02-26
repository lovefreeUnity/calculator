import 'package:calculator/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProviderCalculator extends StatelessWidget {
  ProviderCalculator({Key? key}) : super(key: key);

  int inputNum = 0;
  final CountProvider _countProvider = CountProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _countProvider,
      builder: (context, child) {
        return WillPopScope(
            child: Scaffold(
              body: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<CountProvider>(
                      builder: (BuildContext context, value, Widget? child) {
                        return Text('결과 : ${value.countNumber}');
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
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
                                _countProvider.addEvent(inputNum);
                              },
                              child: Text('+')),
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                _countProvider.subtractEvent(inputNum);
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
              Navigator.pop(context, _countProvider.countNumber);
              return false;
            });
      },
    );
  }
}
