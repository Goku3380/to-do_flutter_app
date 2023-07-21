import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewObjective extends StatefulWidget {
  NewObjective({required this.add, required this.isContinue, super.key});
  NewObjective.addtask({required this.add, super.key});

  final void Function(String title) add;
  void Function()? isContinue;
  @override
  State<NewObjective> createState() => _NewObjectiveState();
}

class _NewObjectiveState extends State<NewObjective> {
  TextEditingController ctrl = TextEditingController();

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(children: [
          TextField(
            controller: ctrl,
            decoration: InputDecoration(
              label: const Text("Task title"),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.black),
            maxLength: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (ctrl.text.isEmpty != true) {
                      Navigator.pop(context);
                      if (widget.isContinue != null ) {
                        widget.isContinue!();
                      }
                        widget.add(ctrl.text);
                    }
                  },
                  child: const Text("Add task")),
              const Spacer(),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"))
            ],
          ),
        ]));
  }
}
