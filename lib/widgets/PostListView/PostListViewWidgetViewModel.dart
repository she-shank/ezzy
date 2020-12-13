import 'package:ezzy/global.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/services/DatabaseService.dart';
import 'package:ezzy/services/NavigationService.dart';
import 'package:ezzy/services/CloudStorageService.dart';
import 'package:ezzy/datamodel/Post.dart';

class PostListViewWidgetViewModel extends BaseViewModel {

  PostListViewWidgetViewModel({this.tag});

  final DatabaseService _db = locator<DatabaseService>();
  final NavigationService _nav = locator<NavigationService>();
  final postTag tag;

  List<Post> _posts = [];
  get posts => _posts;

  void subscribeToPostsStream(){
    _db.postsListener(tag).listen((postData) {
      if(postData!=null){
        _posts.addAll(postData);
        notifyListeners();
      }
    });
  }

  void requestMorePosts(postTag tag) => _db.getPostsPaginated(tag);

}