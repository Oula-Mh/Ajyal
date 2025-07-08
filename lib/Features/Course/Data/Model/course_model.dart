class CourseModel {
  final int id;
  final String name;

  CourseModel({required this.id, required this.name});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(id: json['id'], name: json['name']);
  }
}
