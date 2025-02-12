import 'package:bloc_clean_architecture/data/repositories/todo_repository_impl.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';
import 'package:bloc_clean_architecture/domain/usecases/add_todos_usecase.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';
import 'package:bloc_clean_architecture/presentation/screens/todo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final TodoRepository repository = TodoRepositoryImpl();
  final getTodosUseCase = GetTodosUseCase(repository);
  final addTodoUseCase = AddTodoUseCase(repository);

  runApp(MyApp(
    getTodosUseCase: getTodosUseCase,
    addTodoUseCase: addTodoUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetTodosUseCase getTodosUseCase;
  final AddTodoUseCase addTodoUseCase;

  const MyApp(
      {super.key, required this.getTodosUseCase, required this.addTodoUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc_Clean_Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoWrapper(
        getTodosUseCase: getTodosUseCase,
        addTodoUseCase: addTodoUseCase,
      ),
    );
  }
}
