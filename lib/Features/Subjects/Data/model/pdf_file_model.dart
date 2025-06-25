class PdfFileModel {
  final int? id; // هنا جعلنا id يقبل null
  final String title;
  final String filePath;

  PdfFileModel({this.id, required this.title, required this.filePath});

  factory PdfFileModel.fromJson(Map<String, dynamic> json) {
    return PdfFileModel(
      id: json['id'], // لا مشكلة إذا كانت null الآن
      title: json['title'],
      filePath: json['file_path'],
    );
  }
}
