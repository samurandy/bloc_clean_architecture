import 'package:flutter/foundation.dart';

@immutable
class Todo {
  final String id;
  final String title;

  const Todo({required this.id, required this.title});

  @override
  String toString() {
    return 'Todo{id: $id, title: $title}';
  }

  Todo copyWith({String? title, bool? completed}) {
    return Todo(
      id: id,
      title: title ?? this.title,
    );
  }
}
