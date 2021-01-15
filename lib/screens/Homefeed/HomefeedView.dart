import 'package:ezzy/global.dart';
import 'package:ezzy/services/DialogService.dart';
import 'package:ezzy/widgets/PostListView/PostListViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ezzy/screens/Homefeed/HomefeedViewModel.dart';

import '../../ServiceLocator.dart';

class HomefeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomefeedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text("Homefeed"),
          ),
          body: Container(
            child: Column(
              children: [
                Flexible(
                  flex: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: postTag.values
                                  .asMap()
                                  .entries
                                  .map((e) => GestureDetector(
                                        onTap: () =>
                                            model.handleTagResponse(e.key),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 2),
                                            child: Container(
                                              color: Colors.grey,
                                              padding: EdgeInsets.all(20),
                                              child: Text(tagToString(e.value)),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList())),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IndexedStack(
                    index: model.currentIndex,
                    children: model.postListViewWidgetList,
                  ),
                )
              ],
            ),
          )),
      viewModelBuilder: () => HomefeedViewModel(),
      onModelReady: (model) => model.initializeLists(),
    );
  }
}