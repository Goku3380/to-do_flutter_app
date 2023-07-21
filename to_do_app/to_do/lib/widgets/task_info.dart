import 'package:flutter/material.dart';
import 'package:to_do/models/todo_model.dart';

import 'new_objective.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo(
      {required this.project,
      required this.index,
      super.key,
      required this.onChangeChecked});
  final ToDoModel project;
  final int index;
  final void Function() onChangeChecked;
  @override
  State<TaskInfo> createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {



  void _addNewObjective(String title) {
    var task = TodoTaskModel(title: title, isChecked: false);
    setState(() {
      widget.project.tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<bool> checkValue = [];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/image6.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(30)),
          height: 300,
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.project.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Expanded(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                    height: 25,
                  ),
                  Text(
                    "${widget.project.totalCompletedTask} / ${widget.project.tasks.length} Tasks Completed",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                      style: const ButtonStyle().copyWith(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (ctx) => NewObjective.addtask(
                                  add: _addNewObjective,
                                ));
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 24,
                      ))
                ],
              ),
            )
          ]),
        ),
        Container(
          height: 400,
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: widget.project.tasks.length,
              itemBuilder: (ctx, index) {
                var task = widget.project.tasks[index];
                return Row(
                  children: [
                    Checkbox(
                        value: task.isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            task.checked = newValue!;
                            widget.onChangeChecked();
                          });
                        }),
                    Expanded(
                      child: Text(
                        task.title,
                        style: task.isChecked
                            ? Theme.of(context).textTheme.titleSmall!.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black)
                            : Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.black),
                      ),
                    )
                  ],
                );
              }),
        )
      ]),
    );
  }
}
