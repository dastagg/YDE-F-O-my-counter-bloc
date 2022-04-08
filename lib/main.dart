import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/blocs/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Counter Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${context.watch<CounterBloc>().state.counter}',
          style: const TextStyle(
            fontSize: 52.0,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Long Version
              // BlocProvider.of<CounterBloc>(context)
              //     .add(IncrementCounterEvent());
              // -- Short Version
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
            heroTag: 'increment',
          ),
          const SizedBox(width: 10.0),
          FloatingActionButton(
            onPressed: () {
              // Long Version
              // BlocProvider.of<CounterBloc>(context)
              //     .add(DecrementCounterEvent());
              // -- Short Version
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
            heroTag: 'decrement',
          ),
        ],
      ),
    );
  }
}
