import 'package:flutter/material.dart';
import 'package:todo_apps/components/form_dialog.dart';
import 'package:todo_apps/components/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myController = TextEditingController();
  List todoList = [
    ["make cupcake", true],
    ["make tutorial", true],
  ];

  void showFormDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FormDialog(
            onSave: () {
              setState(() {
                return todoList.add([_myController.text, false]);
              });
              Navigator.pop(context);
            },
            onCacel: () {
              Navigator.pop(context);
            },
            controller: _myController,
          );
        });
  }

  void deleteTask(index){
    setState(() {
       todoList.removeAt(index);
    });
  }

  void checkBoxChange(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        title: const Text("TO DO"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showFormDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(
            taskName: todoList[index][0],
            isTaskCompleted: todoList[index][1],
            onChange: (value) => checkBoxChange(index), deleteItem: (context ) { deleteTask(index); },
          );
        },
      ),
    );
  }
}
