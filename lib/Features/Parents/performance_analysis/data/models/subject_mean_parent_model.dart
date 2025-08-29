class SubjectMeanParentModel {
  final int id;
  final String name;
  final double mean;

  SubjectMeanParentModel({
    required this.id,
    required this.name,
    required this.mean,
  });

  factory SubjectMeanParentModel.fromJson(Map<String, dynamic> json) {
    return SubjectMeanParentModel(
      id: json['id'],
      name: json['name'],
      mean: (json['mean'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "mean": mean};
  }
}
