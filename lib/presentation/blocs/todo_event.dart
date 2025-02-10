import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;

  AddTodo(this.title);

  @override
  List<Object> get props => [title];
}
