import "dart:convert";

class Event {
  String title;
  String description;
  String date;
  String imageUrl;

  Event(
      {required this.title,
      required this.description,
      required this.date,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'imageUrl': imageUrl
    };
  }

  factory Event.fromMap(Map<String, dynamic> data) {
    return Event(
        title: data['title'],
        description: data['description'],
        date: data['date'],
        imageUrl: data['imageUrl']);
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
