class Habit {
  const Habit({
    required this.id,
    required this.name,
    required this.isCompleted,
    required this.date,
  });

  final String id;
  final String name;
  final bool isCompleted;
  final DateTime date;

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'] as String,
      name: json['name'] as String,
      isCompleted: json['isCompleted'] as bool,
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isCompleted': isCompleted,
      'date': date.toIso8601String(),
    };
  }

  Habit copyWith({bool? isCompleted, String? name}) {
    return Habit(
      id: id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date,
    );
  }
}
