import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_clean_architecture/domain/repositories/todo_repository.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_todos_usecase.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late GetTodosUseCase useCase;
  late MockTodoRepository mockRepository;

  setUp(() {
    mockRepository = MockTodoRepository();
    useCase = GetTodosUseCase(mockRepository);
  });

  test('Debe retornar una lista de tareas', () async {
    // Arrange
    when(() => mockRepository.getTodos()).thenAnswer((_) async => []);

    // Act
    final result = await useCase(); // Esperamos que se complete el Future

    // Assert
    expect(result, []);
    verify(() => mockRepository.getTodos()).called(1);
  });
}
