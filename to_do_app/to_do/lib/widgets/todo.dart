import 'package:flutter/material.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/widgets/new_task.dart';
import 'package:to_do/widgets/todo_list.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  void _addTask(String title, List<TodoTaskModel> tasks) {
    var proyect = ToDoModel(title: title, tasks: tasks);

  setState(() {
    
    registratedTasks.add(proyect);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Proyects( ${registratedTasks.length} )"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TodoList(
            tasks: registratedTasks,
          )),
        ],
      ),
      floatingActionButton: IconButton(
        style: const ButtonStyle().copyWith(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            iconColor: const MaterialStatePropertyAll(Colors.black)),
        icon: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (ctx) => NewTask(addTaskToList: _addTask),
          );
        },
      ),
    );
  }
}
