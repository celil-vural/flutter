part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int sayac;
  const CounterState({required this.sayac});
}

class CounterInitial extends CounterState {
 const CounterInitial({required int initialState}):super(sayac: initialState);
}
class MyCounterState extends CounterState{
  const MyCounterState({required int sayac}):super(sayac: sayac);
}