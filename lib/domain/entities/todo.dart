class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, this.completed = false});

  @override
  String toString() {
    return 'Todo{id: $id, title: $title}';
  }
}
