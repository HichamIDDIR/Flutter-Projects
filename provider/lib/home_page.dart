import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/counter_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Center(child: Text(widget.title)),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("You have pushed the button this many times."),
                  Text(
                    value.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // get access to counter class
                final counter = context.read<CounterModel>();

                //increment
                counter.increment();
              },
              tooltip: "Increment",
              child: Icon(Icons.add),
            ),
          ),
    );
  }
}
