import 'package:ezzy/global.dart';
import 'package:ezzy/widgets/PostListView/PostListViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/services/DatabaseService.dart';
import 'package:ezzy/services/NavigationService.dart';
import 'package:ezzy/services/CloudStorageService.dart';
import 'package:ezzy/datamodel/Post.dart';


class HomefeedViewModel extends BaseViewModel{
  final DatabaseService _db = locator<DatabaseService>();
  final NavigationService _nav = locator<NavigationService>();
  int currentIndex = 0;

  var PostListViewWidgetKeyList = List.generate(postTag.values.length, (_) => GlobalKey<PostListViewWidgetState>());
  var PostListViwWidgetList = List.generate(postTag.values.length, (i) => PostListViewWidget(tag: postTag.values[i], key: PostListViewWidgetKeyList[i],));
  List<PostListViewWidget> PostListViewWidgetList = [];
  int i = 0;

  


  handleTagResponse(int index) {
    currentIndex = index;
    print(currentIndex);
    notifyListeners();
  }
}