import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/global.dart';
import 'package:ezzy/widgets/CreationAwareWidget.dart';
import 'package:ezzy/widgets/PostListItem.dart';
import 'package:ezzy/widgets/PostListView/PostListViewWidgetViewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PostListViewWidget extends StatefulWidget {
  final postTag tag;

  PostListViewWidget({Key key,this.tag}) : super(key: key);

  @override
  PostListViewWidgetState createState() => PostListViewWidgetState();
}

class PostListViewWidgetState extends State<PostListViewWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostListViewWidgetViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
          child: ListView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index) {
                return CreationAwareWidget(
                  onWidgetCreated: () {
                    if (index % 20 == 0) model.requestMorePosts(widget.tag);
                  },
                  child: PostListItem(post: model.posts[index]),
                );
              }),
        );
      },
      viewModelBuilder: () => locator<PostListViewWidgetViewModel>(param1: widget.tag),
      onModelReady: (model) => model.subscribeToPostsStream(),
    );
  }
}
