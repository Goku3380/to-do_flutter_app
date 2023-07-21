import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/widgets/new_objective.dart';

class NewTask extends StatefulWidget {
  const NewTask({required this.addTaskToList, super.key});

  final void Function(String title, List<TodoTaskModel> tasks) addTaskToList;
  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController proyectCtrl = TextEditingController();
  TextEditingController masterTitleCtrl = TextEditingController();
  List<TodoTaskModel> taskList = [];

  bool isContinue = false;
  void _addNewObjective(String title) {
    taskList.add(TodoTaskModel(title: title, isChecked: false));
  }

  @override
  Widget build(BuildContext context) {
    void isContinueChange() {
      setState(() {
        isContinue = true;
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
          const Row(
            children: [
              Text("New Proyect"),

            ],
          ),
          Row(
            children: [
              Text(
                "New Project",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                      label: Text(
                        "Project name",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )),
                  controller: proyectCtrl,
                  maxLength: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (ctx) => NewObjective(
                              add: _addNewObjective,
                              isContinue: isContinueChange,
                            ));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add task"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: isContinue
                        ? () {
                            if (proyectCtrl.text.isNotEmpty &&
                                taskList.isNotEmpty) {
                              widget.addTaskToList(
                                proyectCtrl.text,
                                taskList,
                              );
                            }

                            Navigator.pop(context);
                          }
                        : null,
                    child: const Text("Continue"))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    proyectCtrl.dispose();
    super.dispose();
  }
}
