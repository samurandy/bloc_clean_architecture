import 'package:equatable/equatable.dart';

sealed class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadToDos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;

  AddTodo(this.title);

  @override
  List<Object> get props => [title];
}
