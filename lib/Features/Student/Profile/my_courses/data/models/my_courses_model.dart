class MyCoursesModel {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String section;
  final String scheduleImage;

  MyCoursesModel({
    required this.name,
    required String startDate,
    required String endDate,
    required this.section,
    required this.scheduleImage,
  }) : startDate = DateTime.parse(startDate),
       endDate = DateTime.parse(endDate);

  factory MyCoursesModel.fromJson(Map<String, dynamic> json) {
    return MyCoursesModel(
      name: json['name'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      section: json['section'] as String,
      scheduleImage: json['scheduleImage'] as String,
    );
  }
}
