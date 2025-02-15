import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:bloc_clean_architecture/domain/usecases/add_todos_usecase.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_event.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodosUseCase getTodos;
  final AddTodoUseCase addTodo;

  TodoBloc({required this.getTodos, required this.addTodo})
      : super(TodoLoading()) {
    on<LoadToDos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
  }

  Future<void> _onLoadTodos(LoadToDos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await getTodos();
      print("📌 getTodos() devuelve: $todos");
      emit(TodoLoaded(todos));
    } catch (e, stackTrace) {
      print("❌ Error en getTodos(): $e");
      print(stackTrace);
      emit(TodoError("Error al cargar las tareas"));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    if (state is TodoLoaded) {
      final currentTodos = (state as TodoLoaded).todos;
      final newTodo = Todo(id: DateTime.now().toString(), title: event.title);

      try {
        await addTodo(newTodo);
        emit((state as TodoLoaded).copyWith(todos: [...currentTodos, newTodo]));
      } catch (e) {
        emit(TodoError("Error al agregar la tarea"));
      }
    }
  }
}
