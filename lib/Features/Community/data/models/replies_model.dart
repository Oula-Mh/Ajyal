class RepliesModel {
  final String message;
  final IssueData data;
  final int code;

  RepliesModel({required this.message, required this.data, required this.code});

  factory RepliesModel.fromJson(Map<String, dynamic> json) {
    return RepliesModel(
      message: json['message'],
      data: IssueData.fromJson(json['data']),
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "data": data.toJson(), "code": code};
  }
}

class IssueData {
  final int id;
  final int communityId;
  final String authorType;
  final int authorId;
  final String body;
  final int isFqa;
  final String createdAt;
  final String updatedAt;
  final IssueImage? image;
  final List<Reply> replies;

  IssueData({
    required this.id,
    required this.communityId,
    required this.authorType,
    required this.authorId,
    required this.body,
    required this.isFqa,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    required this.replies,
  });

  factory IssueData.fromJson(Map<String, dynamic> json) {
    return IssueData(
      id: json['id'],
      communityId: json['community_id'],
      authorType: json['author_type'],
      authorId: json['author_id'],
      body: json['body'],
      isFqa: json['is_fqa'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'] != null ? IssueImage.fromJson(json['image']) : null,
      replies: (json['replies'] as List).map((e) => Reply.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "community_id": communityId,
      "author_type": authorType,
      "author_id": authorId,
      "body": body,
      "is_fqa": isFqa,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "image": image?.toJson(),
      "replies": replies.map((e) => e.toJson()).toList(),
    };
  }
}

class IssueImage {
  final int id;
  final String path;
  final String imageableType;
  final int imageableId;
  final String createdAt;
  final String updatedAt;

  IssueImage({
    required this.id,
    required this.path,
    required this.imageableType,
    required this.imageableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory IssueImage.fromJson(Map<String, dynamic> json) {
    return IssueImage(
      id: json['id'],
      path: json['path'],
      imageableType: json['imageable_type'],
      imageableId: json['imageable_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "path": path,
      "imageable_type": imageableType,
      "imageable_id": imageableId,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}

class Reply {
  final int id;
  final int issueId;
  final String authorType;
  final int authorId;
  final String body;
  final String createdAt;
  final String updatedAt;
  final IssueImage? image;
  final Author author;

  Reply({
    required this.id,
    required this.issueId,
    required this.authorType,
    required this.authorId,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    required this.author,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      id: json['id'],
      issueId: json['issue_id'],
      authorType: json['author_type'],
      authorId: json['author_id'],
      body: json['body'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'] != null ? IssueImage.fromJson(json['image']) : null,
      author: Author.fromJson(json['author']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "issue_id": issueId,
      "author_type": authorType,
      "author_id": authorId,
      "body": body,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "image": image?.toJson(),
      "author": author.toJson(),
    };
  }
}

class Author {
  final int id;
  final String name;

  Author({required this.id, required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}
