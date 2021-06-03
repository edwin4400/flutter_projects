import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    addTx(enteredTitle, enteredAmount);
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
