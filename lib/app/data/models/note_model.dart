class Note {
  String? title;
  String? description;
  int? timestamp;
  String id = "";

  Note({this.title, this.description, this.timestamp, required this.id});

  factory Note.fromJson(Map<String, dynamic>? json) => Note(
        title: json?["title"] ?? "",
        description: json?["description"] ?? "",
        timestamp: json?["timestamp"] ?? "",
        id: json?["id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "timestamp": timestamp,
        "id": id,
      };
}
