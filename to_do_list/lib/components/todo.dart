class Task {
  final int id;
  final String title;
  final bool week;
  final bool month;
  final bool year;
  final DateTime data;
  final String description;

  Task({
    required this.id,
    required this.title,
    required this.week,
    required this.month,
    required this.year,
    required this.data,
    required this.description,
  });
}
