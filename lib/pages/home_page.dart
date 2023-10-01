import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_to_do/components/dialog_box.dart';
import 'package:hive_to_do/components/to_do_tile.dart';
import 'package:hive_to_do/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _myBox = Hive.box("MyBox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // Already exists data
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewtask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewtask,
            onCancel: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  void deleteTask(index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222230),
      appBar: AppBar(
        title: const Text("To Do App"),
        centerTitle: true,
        elevation: 0,
      ),

      // Button for creating a task:
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),

      // Save button and cancel button.

      // Task List:
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          //Tile
          return ToDoTile(
            task: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => {checkBoxChanged(value, index)},
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
