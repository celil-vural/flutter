part of 'counter_bloc.dart';

@immutable
abstract class CounterStateBloc {
  final int sayac;
  const CounterStateBloc({required this.sayac});
}

class CounterInitial extends CounterStateBloc {
 const CounterInitial({required int initialState}):super(sayac: initialState);
}
class MyCounterState extends CounterStateBloc{
  const MyCounterState({required int sayac}):super(sayac: sayac);
}