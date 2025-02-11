import 'package:bloc_clean_architecture/data/repositories/todo_repository_impl.dart';
import 'package:bloc_clean_architecture/domain/usecases/add_todos_usecase.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_bloc.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_event.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoWrapper extends StatelessWidget {
  const TodoWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => TodoBloc(
          getTodos: GetTodosUseCase(TodoRepositoryImpl()),
          addTodo: AddTodoUseCase(TodoRepositoryImpl()),
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
                if (state is TodoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodoLoaded) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        title: Text(todo.title),
                      );
                    },
                  );
                } else if (state is TodoError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
