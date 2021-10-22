import 'package:flutter/material.dart';
import 'package:flutter_call_outcome/flutter_call_outcome.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCallAsync = false;
  int count = -1;
  late CallOutcome<String> result;

  Future<CallOutcome<String>> functionAsync() async {
    Future.delayed(const Duration(milliseconds: 1500), () {});
    return CallOutcome(data: "Hello world from async");
  }

  CallOutcome<String> function() {
    setState(() {
      count++;
    });
    if (count % 2 == 0) {
      return CallOutcome<String>(data: "Hello world from sync");
    } else {
      return CallOutcome<String>(exception: Exception("Hello world"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Text(count == -1
                ? "Start"
                : result.data ?? result.exception.toString())),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (isCallAsync) {
              result = await functionAsync();
            } else {
              result = function();
            }
            setState(() {
              isCallAsync = !isCallAsync;
            });
          },
          child: const Icon(Icons.reply),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
