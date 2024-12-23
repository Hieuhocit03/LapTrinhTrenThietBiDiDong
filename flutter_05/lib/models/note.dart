import 'package:flutter_05/models/user.dart';

class Note {
  int? id;
  String title;
  String content;
  DateTime createdAt;
  int userId;

  Note({this.id,
        required this.title,
        required this.content,
        DateTime? createdAt,
        required this.userId,
      }) : this.createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map){
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      userId: map['userId'],
    );
  }
}