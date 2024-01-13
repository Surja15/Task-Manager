// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todotute/data/database.dart';
import 'package:todotute/util/dialog_box.dart';
import 'package:todotute/util/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference hive box
final _myBox = Hive.box('mybox');
ToDoDataBase db = ToDoDataBase();

@override
void initState()
{
  //TODO Implement initstate

  //if this is the first time ever opening the app, then create default data
  if(_myBox.get("TODOLIST") == null){
    db.createInitialData();
  }
  else
  {
    //there already exists data
    db.loadData();
  }
  super.initState();
}
  //text controller
final _controller =TextEditingController();
  //list of todo


void checkBoxChanged(bool? value, int index)
{
setState(() {
  db.toDoList[index][1] = !db.toDoList[index][1];
});
db.updateDatabase();
}

//save new task
void saveNewTask()
{
  setState(() {
    db.toDoList.add([_controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDatabase();
}
//createNewTask
void createNewTask()
{
showDialog(context: context, builder: (context){
  return DialogBox(controller: _controller,
  onSave: saveNewTask,
  onCancel: ()=> Navigator.of(context).pop(),);

},

);
}

//deletetask
void deleteTask(int index)
{
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDatabase();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 255, 239),
      appBar: AppBar(
       centerTitle: true, title: Text('Task Manager - Surja'),
       elevation: 0,
       backgroundColor: Color.fromARGB(255, 39, 255, 226),

      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      
      child: Icon(Icons.add),backgroundColor: Colors.teal,),
      
      body: ListView.builder(itemCount: db.toDoList.length, itemBuilder: (context, index) {
        return ToDoTile(
          taskName: db.toDoList[index][0],
         taskCompleted: db.toDoList[index][1], 
         onChanged:(value) => checkBoxChanged(value, index),
         deleteFunction: (context) => deleteTask(index),
         );
      },
      )


    );
    
  }
}


