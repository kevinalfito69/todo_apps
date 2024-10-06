import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget{
  final String taskName;
  final bool isTaskCompleted;
  final Function(bool?)? onChange;
  final Function(BuildContext)? deleteItem;

   const TodoItem({super.key, required this.taskName, required this.isTaskCompleted, required this.onChange, required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      clipBehavior: Clip.antiAlias,
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [SlidableAction(onPressed: deleteItem,backgroundColor: Colors.red,icon: Icons.delete_outline,)]),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.teal[100],
          ),
          child: Row(
            children: [
              Checkbox(value: isTaskCompleted, onChanged:onChange),
              const SizedBox(width: 26,),
              Text(taskName, textAlign: TextAlign.center,style: TextStyle(fontSize: 24,color: Colors.teal[800],decoration:isTaskCompleted?TextDecoration.lineThrough:TextDecoration.none ),)
            ],
          ),
        ),
      ),
    );
  }

}