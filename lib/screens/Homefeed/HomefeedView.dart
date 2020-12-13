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
          body: Column(
            children: [
              ListView.builder(
                itemCount: postTag.values.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => model.handleTagResponse(index),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                        child: Container(
                          color: Colors.grey,
                          padding: EdgeInsets.all(20),
                          child: Text(postTag.values[index].toString()),
                        ),
                      ),
                    ),
                  );
                }
              ),
              IndexedStack(
                index: model.currentIndex,
                children: model.PostListViewWidgetList,
              )
            ],
          )
        ),
        viewModelBuilder: () => HomefeedViewModel()
    );
  }
}
