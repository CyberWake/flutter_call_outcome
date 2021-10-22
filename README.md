<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# function_call_outcome
This is a dart package inspired by GoLang's response and error parsing functionality at the same time.
This package provide with a datatype that can we used to return data and exception from a function call at the same time.
To provide the flexibility with the datatype of the data field in the object you can strongly couple the object to store a specific type of value by using a TypedConstructor.

# 🛠Features

- [x] return a data variable and exception from a function at the same time.
- [X] make data strongly coupled to store in particular datatype value only.
- [ ] provide the ability to return multiple parameters which isn't supported in dart.

# ⚡️Getting started

## 🎖Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  function_call_outcome: ^0.0.1
```

Than import the package via:
```dart
import 'package:function_call_outcome/function_call_outcome.dart';
```

## 🎮Usage

```dart
import 'package:flutter/material.dart';
import 'package:function_call_outcome/function_call_outcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCallAsync = false;
  int count = -1;
  late CallOutcome<String> result;

  Future<CallOutcome<String>> functionAsync()async{
      Future.delayed(const Duration(milliseconds: 1500),(){
      });
      return CallOutcome(data: "Hello world from async");
  }

  CallOutcome<String> function(){
      setState((){
        count++;
      });
    print(count);
      if(count%2==0){
          return CallOutcome<String>(data: "Hello world from sync");
      }else{
          return CallOutcome<String>(exception: Exception("Hello world"));
      }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(count == -1?"Start":result.data??result.exception.toString())
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
              if(isCallAsync){
                result = await functionAsync();
              }else{
                result = function();
              }
              setState((){
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
```

# ☀️Created and Maintained by:
Developed by:

<table>
  <tr>
    <td align="center"><a href="https://github.com/CyberWake"><img src="https://avatars.githubusercontent.com/u/44184786?s=100" width="100px;" alt=""/><br /><sub><b>CyberWake</b></sub></a></td>
  </tr>
</table>
<br/>

# 🐛Issues & Feedback
Please file an [issue!](https://github.com/CyberWake/flutter_call_outcome/issues) to send feedback or report a bug. Thank you!