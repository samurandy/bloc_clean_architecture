import 'package:bloc_clean_architecture/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';

sealed class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);

  TodoLoaded copyWith({List<Todo>? todos}) {
    return TodoLoaded(todos ?? this.todos);
  }

  @override
  List<Object> get props => [todos];
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);

  @override
  List<Object> get props => [message];
}
