import 'package:bloc_crud_practice/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 0;
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter BLOC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "You have pushed the button this many times:"), // Text Text (
            StreamBuilder<int>(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  // style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(128.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(CounterAction.increment);
              },
              child: const Icon(
                Icons.plus_one,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(CounterAction.decrement);
              },
              child: const Icon(
                Icons.exposure_minus_1,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(CounterAction.reset);
              },
              child: const Icon(
                Icons.loop,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
