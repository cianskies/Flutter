// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';

import '../models/models.dart';

NewsResponse newsResponseFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
    String status;
    int totalResults;
    List<Article> articles;

    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

