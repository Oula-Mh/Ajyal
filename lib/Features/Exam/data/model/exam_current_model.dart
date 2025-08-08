class ExamCurrentModel {
  final int id;
  final String name;
  final DateTime startTime;
  final int durationMinutes;
  final bool isAvailable;

  ExamCurrentModel({
    required this.id,
    required this.name,
    required this.startTime,
    required this.durationMinutes,
    required this.isAvailable,
  });

  factory ExamCurrentModel.fromJson(Map<String, dynamic> json) {
    return ExamCurrentModel(
      id: json['id'],
      name: json['name'],
      startTime: DateTime.parse(json['start_time']),
      durationMinutes: double.parse(json['duration']).round(),
      isAvailable: json['available'] == 1,
    );
  }

  DateTime get endTime => startTime.add(Duration(minutes: durationMinutes));
}
