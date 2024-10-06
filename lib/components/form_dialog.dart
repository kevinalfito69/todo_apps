import 'package:flutter/material.dart';

class FormDialog extends StatelessWidget{
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCacel;
  const FormDialog({super.key,required this.controller, required this.onSave, required this.onCacel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.tealAccent[200],
      title: const Text("Add To do "),
      content: TextField(controller: controller,),
      actions: [
        ElevatedButton(onPressed: onSave, child: const Text("Submit")),
        TextButton(onPressed: onCacel, child: const Text("Cancel")),
      ],
    );
  }

}