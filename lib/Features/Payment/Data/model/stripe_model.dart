class StripeLinkModel {
  final String link;

  StripeLinkModel({required this.link});

  factory StripeLinkModel.fromJson(Map<String, dynamic> json) {
    return StripeLinkModel(link: json['checkout_url']);
  }
}
