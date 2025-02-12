import 'package:bloc_clean_architecture/domain/usecases/add_todos_usecase.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_bloc.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_event.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoWrapper extends StatelessWidget {
  final GetTodosUseCase getTodosUseCase;
  final AddTodoUseCase addTodoUseCase;
  const TodoWrapper(
      {super.key, required this.getTodosUseCase, required this.addTodoUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => TodoBloc(
          getTodos: getTodosUseCase,
          addTodo: addTodoUseCase,
        )..add(LoadToDos()),
        child: _TodoScreen(),
      ),
    );
  }
}

class _TodoScreen extends StatelessWidget {
  _TodoScreen();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    final title = controller.text.trim();
                    context.read<TodoBloc>().add(AddTodo(
                          title,
                        ));
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return switch (state) {
                  TodoLoading() =>
                    const Center(child: CircularProgressIndicator()),
                  TodoLoaded(:final todos) => ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return ListTile(
                          title: Text(todo.title),
                        );
                      },
                    ),
                  TodoError(:final message) => Center(child: Text(message)),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
