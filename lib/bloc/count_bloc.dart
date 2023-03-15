import 'dart:async';

class CountBloc {
  final StreamController<int> _streamController = StreamController<int>();

  //Bloc 현재 값을 가지고 잇는 속성
  int _value = 0;

  CountBloc() {
    _streamController.sink.add(_value);
  }

  //view 가 가져갈 value
  Stream<int> get countStream => _streamController.stream;

  addEvent(int num) {
    _value += num;
    _streamController.sink.add(_value);
  }

  subtractEvent(int num) {
    _value -= num;
    _streamController.sink.add(_value);
  }
  dispose(){
    _streamController.close();
  }
}
CountBloc countBloc = CountBloc();