import 'package:ezzy/global.dart';
import 'package:flutter/material.dart';


class Post {
  final String PID;
  final String photoURL;
  final String authorUID;
  final String title;
  final String body;
  final DateTime createTimeStamp;
  final int likesCount;
  final postTag tag;

  Post({
    @required this.PID,
    @required this.photoURL,
    @required this.authorUID,
    @required this.title,
    @required this.body,
    @required this.createTimeStamp,
    @required this.likesCount,
    @required this.tag
  });

  factory Post.fromMap(Map data) {
    return Post(
      PID: data['PID'],
      photoURL: data['photoURL'],
      authorUID: data['authorUID'],
      title: data['title'],
      body: data['body'],
      createTimeStamp: data['createTimeStamp'].toDate(),
      likesCount: data['likesCount'],
      tag: tagFromString(data['tag'])
    );
  }

  Map<String, dynamic> toMap (){
    return {
      'PID': PID,
      'photoURL': photoURL,
      'authorUID': authorUID,
      'title': title,
      'body': body,
      'createTimeStamp': createTimeStamp,
      'likesCount': likesCount,
      'tag': tagToString(tag)
    };
  }

}
