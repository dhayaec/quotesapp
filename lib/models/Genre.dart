import 'dart:convert';

Genre genreFromJson(String str) {
  final jsonData = json.decode(str);
  return Genre.fromJson(jsonData);
}

String genreToJson(Genre data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Genre {
  int id;
  String name;
  int weight;

  Genre({
    this.id,
    this.name,
    this.weight,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "weight": weight,
      };
}
