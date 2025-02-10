import 'package:bloc_clean_architecture/domain/entities/todo.dart';

abstract class TodoRepository {
  List<Todo> getTodos();
  void addTodo(Todo todo);
}
