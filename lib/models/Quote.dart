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
    int quoteId;
    String quote;
    int authorId;
    int genreId;

    Quote({
        this.quoteId,
        this.quote,
        this.authorId,
        this.genreId,
    });

    factory Quote.fromJson(Map<String, dynamic> json) => new Quote(
        quoteId: json["quoteId"],
        quote: json["quote"],
        authorId: json["authorId"],
        genreId: json["genreId"],
    );

    Map<String, dynamic> toJson() => {
        "quoteId": quoteId,
        "quote": quote,
        "authorId": authorId,
        "genreId": genreId,
    };
}