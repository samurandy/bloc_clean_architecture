import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';

class GetTodosUseCase {
  final TodoRepository repository;

  GetTodosUseCase(this.repository);

  Future<List<Todo>> call() async {
    final todos = await repository.getTodos();
    print("📋 Lista de tareas obtenida: $todos");
    return todos;
  }
}
