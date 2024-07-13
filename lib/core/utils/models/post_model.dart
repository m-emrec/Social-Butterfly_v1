import 'package:flutter/material.dart';

class PostModel {
  final String id;
  final String publishedBy;
  final String header;
  final String content;
  final Image? image;
  final DateTime createdDate;
  final int likeCount;
  final int commentCount;

  PostModel({
    required this.id,
    required this.publishedBy,
    required this.header,
    required this.content,
    this.image,
    required this.createdDate,
    required this.likeCount,
    required this.commentCount,
  });
}
