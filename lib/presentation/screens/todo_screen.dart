import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_bloc.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("To-Do List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(labelText: "Nueva tarea"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final title = controller.text;
                    if (title.isNotEmpty) {
                      context.read<TodoBloc>().add(AddTodo(title));
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, List<Todo>>(
              builder: (context, todos) {
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todos[index].title),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
