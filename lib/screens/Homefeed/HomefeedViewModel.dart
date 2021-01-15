import 'package:ezzy/global.dart';
import 'package:ezzy/widgets/PostListView/PostListViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/services/DatabaseService.dart';
import 'package:ezzy/services/NavigationService.dart';

class HomefeedViewModel extends BaseViewModel {
  final DatabaseService _db = locator<DatabaseService>();
  final NavigationService _nav = locator<NavigationService>();
  int currentIndex = 0;

  var postListViewWidgetList;
  var postListViewWidgetKeyList;
  var dataFetched;

  initializeLists() {
    postListViewWidgetKeyList = List.generate(
        postTag.values.length, (_) => GlobalKey<PostListViewWidgetState>());
    dataFetched =
        List.generate(postTag.values.length, (i) => i == 0 ? true : false);
    postListViewWidgetList = List.generate(
        postTag.values.length,
        (i) => PostListViewWidget(
              key: postListViewWidgetKeyList[i],
              tag: postTag.values[i],
            ));
  }

  handleTagResponse(int index) {
    currentIndex = index;
    if (!dataFetched[index]) {
      dataFetched[index] = !dataFetched[index];
      postListViewWidgetKeyList[index].currentState.handleSubscription();
    }
    print(currentIndex);
    notifyListeners();
  }
}
