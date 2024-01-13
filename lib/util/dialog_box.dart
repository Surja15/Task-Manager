import 'package:flutter/material.dart';
import 'package:todotute/util/my_Button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel} );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
       backgroundColor: Color.fromARGB(255, 30, 247, 211),
      content: Container(height:120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        //get user input
        TextField(
          controller: controller,
          decoration: InputDecoration(border:OutlineInputBorder(),
          hintText:"Add a new task",),
        ),
        //save button cancel button
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children:[

    //save
    MyButton(text: "Save", onPressed: onSave),

    const SizedBox(width:7),
    //cancel
    MyButton(text: "Cancel", onPressed: onCancel)
  ]
)
      ],))
     
      
    );
  }
}