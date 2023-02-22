import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStateBloc> {
  CounterBloc() : super(const CounterInitial(initialState: 50)) {
    on<ArttirCounterEvent>((event, emit) {
      emit(MyCounterState(sayac: state.sayac + 1));
    });
    on<AzaltCounterEvent>((event, emit) {
      emit(MyCounterState(sayac: state.sayac - 1));
    });
  }
}
