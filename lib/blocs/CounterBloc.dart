import 'dart:async';
import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {
  @override
  String toString() => 'Increment';
}

class Decrement extends CounterEvent {
  @override
  String toString() => 'Decrement';
}

class IncrementAsync extends CounterEvent {
  final int value;
  IncrementAsync({this.value = 1});
  @override
  String toString() => 'IncrementAsync';
}

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int currentState, CounterEvent event) async* {
    if (event is Increment) {
      yield currentState + 1;
    }
    if (event is Decrement) {
      yield currentState - 1;
    }
    if (event is IncrementAsync) {
      yield await Future.delayed(
          Duration(seconds: 2), () => currentState + event.value);
    }
  }
}
