// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String? id;
  final String? publishedBy;
  final String? header;
  final String? content;
  final String? imageUrl;
  final DateTime? createdDate;
  final int? likeCount;
  final int? commentCount;

  PostModel({
    this.id,
    this.publishedBy,
    this.header,
    this.content,
    this.imageUrl,
    this.createdDate,
    this.likeCount,
    this.commentCount,
  });

  PostModel copyWith({
    String? id,
    String? publishedBy,
    String? header,
    String? content,
    String? imageUrl,
    DateTime? createdDate,
    int? likeCount,
    int? commentCount,
  }) {
    return PostModel(
      id: id ?? this.id,
      publishedBy: publishedBy ?? this.publishedBy,
      header: header ?? this.header,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      createdDate: createdDate ?? this.createdDate,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'publishedBy': publishedBy,
      'header': header,
      'content': content,
      'imageUrl': imageUrl,
      'createdDate': createdDate?.millisecondsSinceEpoch,
      'likeCount': likeCount,
      'commentCount': commentCount,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      publishedBy: map['publishedBy'] as String,
      header: map['header'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
      likeCount: map['likeCount'] != null ? map['likeCount'] as int : null,
      commentCount:
          map['commentCount'] != null ? map['commentCount'] as int : null,
    );
  }
}
