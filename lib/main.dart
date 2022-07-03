import 'package:flutter/material.dart';
import 'package:nextflow_flutter_stream_controller_with_test/example_stream.dart';

import 'submit_value.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow - StreamController',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Nextflow - StreamController'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ExampleStream exampleStream = ExampleStream();
  SubmitValue? currentSubmitValue;
  @override
  void initState() {
    exampleStream.controller.stream.listen((SubmitValue value) {
      setState(() {
        currentSubmitValue = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current value:',
            ),
            Text(
              '$currentSubmitValue',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                exampleStream.sendToStream(SubmitValue.One);
              },
              child: Text('One'),
            ),
            ElevatedButton(
              onPressed: () {
                exampleStream.sendToStream(SubmitValue.Two);
              },
              child: Text('Two'),
            ),
            ElevatedButton(
              onPressed: () {
                exampleStream.sendToStream(SubmitValue.Three);
              },
              child: Text('Three'),
            )
          ],
        ),
      ),
    );
  }
}
