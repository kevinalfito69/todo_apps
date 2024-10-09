import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_apps/components/form_dialog.dart';
import 'package:todo_apps/components/todo_item.dart';
import 'package:todo_apps/model/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box("myBox");
  final _myController = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  void showFormDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FormDialog(
            onSave: () {
              setState(() {
                return db.todoList.add([_myController.text, false]);
              });
              Navigator.pop(context);
              db.updateDataBase();
              _myController.clear();
            },
            onCacel: () {
              Navigator.pop(context);
              _myController.clear();
            },
            controller: _myController,
          );
        });
  }

  void deleteTask(index){
    setState(() {
       db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void checkBoxChange(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }
  @override
  void initState() {
    // first run app
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
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
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem(
            taskName: db.todoList[index][0],
            isTaskCompleted: db.todoList[index][1],
            onChange: (value) => checkBoxChange(index), deleteItem: (context ) { deleteTask(index); },
          );
        },
      ),
    );
  }
}
