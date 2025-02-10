import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository repository;

  GetTodosUseCase(this.repository);

  List<Todo> call() {
    final todos = repository.getTodos();
    print("📋 Lista de tareas obtenida: ${todos as List}");
    return todos;
  }
}
