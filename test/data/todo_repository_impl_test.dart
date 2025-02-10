import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_clean_architecture/data/repositories/todo_repository_impl.dart';
import 'package:bloc_clean_architecture/domain/entities/todo.dart';

void main() {
  late TodoRepositoryImpl repository;

  setUp(() {
    repository = TodoRepositoryImpl();
  });

  test('Debe iniciar con una lista vacía', () async {
    final todos = await repository.getTodos();
    expect(todos, isEmpty);
  });

  test('Debe agregar una tarea correctamente', () async {
    const todo = Todo(id: '1', title: 'Nueva tarea');

    await repository.addTodo(todo);

    final todos = await repository.getTodos();

    expect(todos, contains(todo));
  });
}
