class Task {
  final int? id;
  final String? title;
  final int? week;
  final int? month;
  final int? year;
  final DateTime? data;
  final String? description;

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
