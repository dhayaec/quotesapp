import 'dart:convert';

Author authorFromJson(String str) {
    final jsonData = json.decode(str);
    return Author.fromJson(jsonData);
}

String authorToJson(Author data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Author {
    int id;
    String name;
    bool popular;

    Author({
        this.id,
        this.name,
        this.popular,
    });

    factory Author.fromJson(Map<String, dynamic> json) => new Author(
        id: json["id"],
        name: json["name"],
        popular: json["popular"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "popular": popular,
    };
}