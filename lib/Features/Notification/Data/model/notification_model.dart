class NotificationModel {
  final int id;
  final String title;
  final String type; // notifiable_type (آخر كلمة فقط)
  final String body;
  final DateTime? createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.type,
    required this.body,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    // نأخذ آخر كلمة من notifiable_type
    final String fullType = json['notifiable_type'] ?? "";
    final String type = fullType.split("\\").last;

    return NotificationModel(
      id: json['id'],
      title: json['title'] ?? "",
      type: type,
      body: json['body'] ?? "",
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
    );
  }
}
