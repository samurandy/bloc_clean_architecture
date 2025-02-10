import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final List<Todo> _todos = [];

  @override
  Future<List<Todo>> getTodos() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.from(_todos);
  }

  @override
  Future<void> addTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    _todos.add(todo);
    print("✅ Tarea agregada: $todo");
  }
}
