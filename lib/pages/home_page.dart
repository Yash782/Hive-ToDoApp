import 'package:flutter/material.dart';
import 'package:hive_to_do/components/dialog_box.dart';
import 'package:hive_to_do/components/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDolist = [
    ["Build App", false],
    ["Do Workout", false],
    ["Drink Chaha", false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDolist[index][1] = !toDolist[index][1];
    });
  }

  void saveNewtask() {
    setState(() {
      toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
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
        itemCount: toDolist.length,
        itemBuilder: (context, index) {
          //Tile
          return ToDoTile(
              task: toDolist[index][0],
              taskCompleted: toDolist[index][1],
              onChanged: (value) => {checkBoxChanged(value, index)});
        },
      ),
    );
  }
}
