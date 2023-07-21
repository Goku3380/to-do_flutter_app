import 'package:flutter/material.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.tasks,
  });
  // final void Function(ExpenseModel expense) onRemoveExpense;

  final List<ToDoModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) =>  TodoCard(tasks[index],index));
  }
}
