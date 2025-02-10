import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/domain/usecases/add_todos_usecase.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  final GetTodosUseCase getTodos;
  final AddTodoUseCase addTodo;

  TodoBloc({required this.getTodos, required this.addTodo}) : super([]) {
    on<LoadTodos>((event, emit) {
      final todos = getTodos();
      emit(todos);
    });

    on<AddTodo>((event, emit) {
      addTodo(Todo(
        id: DateTime.now().toString(),
        title: event.title,
      ));
      final todos = getTodos();
      emit(todos);
    });
  }
}
