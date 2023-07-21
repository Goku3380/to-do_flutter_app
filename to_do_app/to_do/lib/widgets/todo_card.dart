import "package:flutter/material.dart";
import "package:to_do/models/todo_model.dart";
// import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import "package:to_do/widgets/task_info.dart";

class TodoCard extends StatefulWidget {
  const TodoCard(this.task,this.index,{super.key});
  final ToDoModel task;
  final int index;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {

  ToDoModel? task;
  int? index;

  @override
  void initState() {
    task = widget.task;
    index = widget.index;
    
    super.initState();
  }

  void changeCheked(){
    setState(() {
          task = widget.task;
          index = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var random = Random();
    int randomNum = random.nextInt(11);

    const List<AssetImage> imagesList = [
      AssetImage('assets/images/image1.jpg'),
      AssetImage('assets/images/image2.jpg'),
      AssetImage('assets/images/image3.jpg'),
      AssetImage('assets/images/image4.jpg'),
      AssetImage('assets/images/image5.jpg'),
      AssetImage('assets/images/image6.jpg'),
      AssetImage('assets/images/image7.jpg'),
      AssetImage('assets/images/image8.jpg'),
      AssetImage('assets/images/image9.jpg'),
      AssetImage('assets/images/image10.jpg'),
      AssetImage('assets/images/image11.jpg'),
    ];
    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: imagesList[randomNum],
                opacity: 0.75,
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task!.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${task!.totalCompletedTask} / ${task!.tasks.length} ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 300,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (ctx) => TaskInfo(project: task! ,index: index!,onChangeChecked: changeCheked,));
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 32,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



// class TodoCard extends StatelessWidget {
//   const TodoCard( {super.key});

//   // final ToDoModel task;
//   @override
//   Widget build(BuildContext context) {
//     // var random = Random();

    // int randomNumber = random.nextInt(4);

//     return Card(
//       child:  Column(
//             children: [
//               Text(
//                 // task.title,
//                 "A Title",
//                 style: GoogleFonts.raleway(
//                   fontSize: 34,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 // "${task.totalCompletedTask}/${task.tasks.length} tasks",
//                 "1/3",
//                 style: GoogleFonts.raleway(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const Spacer(),
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.menu_rounded),
//                     style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll<Color>(
//                             Color.fromARGB(100, 255, 255, 255))),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.add),
//                     style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll<Color>(
//                             Color.fromARGB(255, 255, 255, 255))),
//                   ),
//                 ],
//               )
//             ],
//           ),

//     );
//   }
// }
