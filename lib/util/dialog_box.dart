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
       backgroundColor: Color.fromARGB(255, 100, 100, 100),
      content: Container(height:120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        //get user input
        TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(border:OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText:"add a task",hintStyle: TextStyle(color: Colors.grey),),
        ),
        //save button cancel button
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children:[
    // Save button
    ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
      child: MyButton(text: "Save", onPressed: onSave),
    ),

    const SizedBox(width:7),

    // Cancel button
    ClipRRect(
      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
      child: MyButton(text: "Cancel", onPressed: onCancel),
    ),
  ],
)
      ],))
     
      
    );
  }
}