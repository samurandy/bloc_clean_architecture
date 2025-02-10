import 'package:bloc_clean_architecture/data/repositories/todo_repository_impl.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';
import 'package:bloc_clean_architecture/presentation/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_bloc.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';
import 'package:bloc_clean_architecture/domain/usecases/add_todos_usecase.dart';

void main() {
  final TodoRepository todoRepository = TodoRepositoryImpl();
  runApp(
    BlocProvider(
      create: (context) => TodoBloc(
        getTodos: GetTodosUseCase(todoRepository),
        addTodo: AddTodoUseCase(todoRepository),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc_Clean_Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoScreen(),
    );
  }
}
