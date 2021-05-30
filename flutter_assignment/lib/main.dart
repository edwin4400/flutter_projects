import 'package:flutter/material.dart';
import 'package:flutter_assignment/changemessage.dart';
import 'package:flutter_assignment/display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _message = [
    'Greetings!!',
    'My name is Eva',
    'I come from Mars',
    'I\'ve come in peace',
  ];

  var _messageIndex = 0;

  void _loopMessage() {
    setState(() {
      if (_messageIndex + 1 == _message.length) {
        _messageIndex = 0;
      } else {
        _messageIndex++;
        print(_messageIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment App'),
        ),
        body: Column(
          children: [
            DisplayText(_message[_messageIndex]),
            ChangeMessage(_loopMessage),
          ],
        ),
      ),
    );
  }
}
