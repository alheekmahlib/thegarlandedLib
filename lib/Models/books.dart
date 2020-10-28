// To parse this JSON data, do
//
//     final bookName = bookNameFromJson(jsonString);

import 'dart:convert';

BookName bookNameFromJson(String str) => BookName.fromJson(json.decode(str));

String bookNameToJson(BookName data) => json.encode(data.toJson());

class BookName {
  BookName({
    this.type,
  });

  Map<String, List<Type>> type;

  factory BookName.fromJson(Map<String, dynamic> json) => BookName(
    type: Map.from(json["type"]).map((k, v) => MapEntry<String, List<Type>>(k, List<Type>.from(v.map((x) => Type.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "type": Map.from(type).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };
}

class Type {
  Type({
    this.id,
    this.title,
    this.bookD,
    this.type,
    this.bookQuoted,
    this.aboutBook,
  });

  String id;
  String title;
  String bookD;
  String type;
  String bookQuoted;
  String aboutBook;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    title: json["title"],
    bookD: json["bookD"],
    type: json["type"],
    bookQuoted: json["bookQuoted"],
    aboutBook: json["aboutBook"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "bookD": bookD,
    "type": type,
    "bookQuoted": bookQuoted,
    "aboutBook": aboutBook,
  };
}
