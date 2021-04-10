import 'package:flutter/material.dart';

class AddTransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "Amount"),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Description"),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            height: 50,
            minWidth: MediaQuery.of(context).size.width - 60,
            color: Color(0xFF5BC8AA),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Confirm",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
