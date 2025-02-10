import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final List<Todo> _todos = [];

  @override
  List<Todo> getTodos() {
    return List.from(_todos);
  }

  @override
  void addTodo(Todo todo) {
    _todos.add(todo);
    print("📌 Se guardó en la lista: ${todo.title}");
  }
}
