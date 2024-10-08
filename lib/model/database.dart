import 'package:hive/hive.dart';

class ToDoDataBase {
  List todoList = [];

  // refrence the box
  final _myBox = Hive.box("myBox");

  // run this if 1st time ever running apps
  void createInitialData() {
    todoList = [
      ["make cupcake", false],
      ["make coffe", false],
    ];
  }

  // load data from db
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update db
  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}
