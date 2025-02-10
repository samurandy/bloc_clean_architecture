import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';

class AddTodoUseCase {
  final TodoRepository repository;

  AddTodoUseCase(this.repository);

  void call(Todo todo) {
    repository.addTodo(todo);
    print("✅ Nueva tarea agregada: ${todo.title}");
  }
}
