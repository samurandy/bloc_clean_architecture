import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_clean_architecture/data/repositories/todo_repository_impl.dart';
import 'package:bloc_clean_architecture/domain/entities/todo.dart';

void main() {
  late TodoRepositoryImpl repository;

  setUp(() {
    repository = TodoRepositoryImpl();
  });

  test('Debe iniciar con una lista vacía', () {
    expect(repository.getTodos(), []);
  });

  test('Debe agregar una tarea correctamente', () {
    final todo = Todo(id: '1', title: 'Nueva tarea');
    repository.addTodo(todo);

    expect(repository.getTodos(), contains(todo));
  });
}
