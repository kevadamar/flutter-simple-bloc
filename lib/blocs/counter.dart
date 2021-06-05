import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<String, int> {
  CounterBloc() : super(0);

  // state
  int _counter = 0;

  // getter state
  get getCounter => _counter;

  @override
  Stream<int> mapEventToState(event) async* {
    // Check Event
    if (event == 'add') {
      _counter++;
    } else {
      _counter--;
    }
    // async* => akan selalu mereturn sebuah Stream
    // async => akan selalu mereturn sebuah Future
    // yield untuk mereturn stream dengan tambahan async*
    yield _counter;
  }
}
