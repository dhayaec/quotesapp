import 'dart:convert';

Quote quoteFromJson(String str) {
  final jsonData = json.decode(str);
  return Quote.fromJson(jsonData);
}

String quoteToJson(Quote data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Quote {
  int id;
  String quote;
  String author;
  String genre;
  bool favorite;

  Quote({
    this.id,
    this.quote,
    this.author,
    this.genre,
    this.favorite,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => new Quote(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
        genre: json["genre"],
        favorite: json["favorite"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
        "genre": genre,
        "favorite": favorite,
      };
}
