import 'package:bloc_clean_architecture/presentation/blocs/todo_event.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_clean_architecture/presentation/blocs/todo_bloc.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';
import 'package:bloc_clean_architecture/domain/usecases/add_todos_usecase.dart';

class MockGetTodosUseCase extends Mock implements GetTodosUseCase {}

class MockAddTodoUseCase extends Mock implements AddTodoUseCase {}

void main() {
  late TodoBloc bloc;
  late MockGetTodosUseCase mockGetTodosUseCase;
  late MockAddTodoUseCase mockAddTodoUseCase;

  setUp(() {
    mockGetTodosUseCase = MockGetTodosUseCase();
    mockAddTodoUseCase = MockAddTodoUseCase();
    bloc = TodoBloc(getTodos: mockGetTodosUseCase, addTodo: mockAddTodoUseCase);
  });

  blocTest<TodoBloc, TodoState>(
    'Debe emitir una lista de tareas vacía al iniciar',
    build: () {
      when(() => mockGetTodosUseCase()).thenAnswer((_) async => []);
      return bloc;
    },
    act: (bloc) => bloc.add(LoadToDos()),
    expect: () => [
      TodoLoading(),
      TodoLoaded(
          const []), // Esperamos que se emita el estado 'TodoLoaded' con una lista vacía
    ],
  );
}
