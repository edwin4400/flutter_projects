import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //need to convert to stateful widget for entry to persist
  final Function addTx; //added by refractoring to link widget to state

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    widget.addTx(enteredTitle,
        enteredAmount); // added by refractoring link state to widget

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) =>
                  submitData(), //reference to anonymous function which submitData() is required to trigger our function
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) =>
                  submitData(), // underscore to take an argument but will not use it in function
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              textColor: Colors.purple,
              onPressed: submitData, //reference to our own function
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
