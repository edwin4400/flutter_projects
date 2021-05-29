import 'package:flutter/material.dart';

class ChangeMessage extends StatelessWidget {
  final Function messageHandler;

  ChangeMessage(this.messageHandler);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Next Message'),
      textColor: Colors.white,
      color: Colors.blue,
      onPressed: () =>
          messageHandler(), //must have messageHandler() if not it wont be invoked when pressed
    );
  }
}
