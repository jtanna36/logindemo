// To parse this JSON data, do
//
//     final listSampleResponse = listSampleResponseFromJson(jsonString);

import 'dart:convert';

List<ListSampleResponse> listSampleResponseFromJson(String str) => List<ListSampleResponse>.from(json.decode(str).map((x) => ListSampleResponse.fromJson(x)));

String listSampleResponseToJson(List<ListSampleResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListSampleResponse {
  ListSampleResponse({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ListSampleResponse.fromJson(Map<String, dynamic> json) => ListSampleResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
