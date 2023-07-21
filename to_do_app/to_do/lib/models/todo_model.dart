import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ToDoModel {
  ToDoModel({required this.title, required this.tasks}) : id = uuid.v4();

  final String id;
  final String title;
  final List<TodoTaskModel> tasks;

  int get totalCompletedTask {
    int total = 0;
    for (final task in tasks) {
      if (task.isChecked) {
        total++;
      }
    }
    return total;
  }
}

class TodoTaskModel {
  TodoTaskModel({required this.title, required this.isChecked})
      : id = uuid.v4();

  final String id;
  final String title;
  bool isChecked;
  set checked(bool value) {
    isChecked = value;
  }
}

List<ToDoModel> registratedTasks = [
  ToDoModel(
    title: "Desarrollo de un Sitio Web Simple",
    tasks: [
      TodoTaskModel(
        title: "Diseño de la interfaz y maquetación.",
        isChecked: true,
      ),
      TodoTaskModel(
        title: "Desarrollo del frontend (HTML, CSS, JavaScript).",
        isChecked: true,
      ),
      TodoTaskModel(
        title:
            "Implementación del backend (manejo de formularios y lógica del sitio).",
        isChecked: false,
      ),
      TodoTaskModel(
        title: "Pruebas y despliegue en un servidor.",
        isChecked: false,
      ),
    ],
  ),
  ToDoModel(
    title: "Creación de una Aplicación Móvil Básica",
    tasks: [
      TodoTaskModel(
        title: "Diseño de la interfaz de usuario (UI/UX)",
        isChecked: true,
      ),
      TodoTaskModel(
        title: "Desarrollo de la aplicación para iOS",
        isChecked: true,
      ),
      TodoTaskModel(
        title: "Desarrollo de la aplicación para Android",
        isChecked: false,
      ),
      TodoTaskModel(
        title: "Pruebas en diferentes dispositivos y tiendas de aplicaciones",
        isChecked: false,
      ),
    ],
  ),
  ToDoModel(
    title: "Lanzamiento de una Campaña de Marketing Digital",
    tasks: [
      TodoTaskModel(
        title: "Investigación y definición del público objetivo",
        isChecked: true,
      ),
      TodoTaskModel(
        title:
            " Creación de contenido y materiales de marketing (textos, imágenes, videos).",
        isChecked: false,
      ),
    ],
  ),
];
