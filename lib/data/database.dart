import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

List toDoList=[];
  //refernce box
  final _myBox =Hive.box('mybox');
//run if this is the first time ever opening this app
  void createInitialData()
  {
List toDoList = [["App Made by",true],["Surja Sekhar Sengupta",true]];
  }
  //load data from database

  void loadData()
  {
toDoList=_myBox.get("TODOLIST");
  }

  //update the database
   void updateDatabase()
   {
_myBox.put("TODOLIST", toDoList);
   }

   //this app was made by Surja
}