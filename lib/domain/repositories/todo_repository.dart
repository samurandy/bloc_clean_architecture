import 'package:bloc_clean_architecture/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
}
