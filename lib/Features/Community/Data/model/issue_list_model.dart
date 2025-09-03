class IssueModel {
  final int id;
  final int communityId;
  final String authorType;
  final int authorId;
  final String body;
  final bool isFqa;
  final DateTime createdAt;
  final DateTime updatedAt;
  final IssueImage? image;
  final IssueAuthor? author;

  IssueModel({
    required this.id,
    required this.communityId,
    required this.authorType,
    required this.authorId,
    required this.body,
    required this.isFqa,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    this.author,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      id: json['id'],
      communityId: json['community_id'],
      authorType: json['author_type'],
      authorId: json['author_id'],
      body: json['body'],
      isFqa: json['is_fqa'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      image: json['image'] != null ? IssueImage.fromJson(json['image']) : null,
      author:
          json['author'] != null ? IssueAuthor.fromJson(json['author']) : null,
    );
  }
}

class IssueImage {
  final int id;
  final String path;

  IssueImage({required this.id, required this.path});

  factory IssueImage.fromJson(Map<String, dynamic> json) {
    return IssueImage(id: json['id'], path: json['path']);
  }
}

class IssueAuthor {
  final int id;
  final String name;

  IssueAuthor({required this.id, required this.name});

  factory IssueAuthor.fromJson(Map<String, dynamic> json) {
    return IssueAuthor(id: json['id'], name: json['name']);
  }
}
