import 'package:ezzy/global.dart';
import 'package:ezzy/screens/Profile/ProfileViewModel.dart';
import 'package:ezzy/services/AuthenticationService.dart';
import 'package:ezzy/services/CloudStorageService.dart';
import 'package:ezzy/services/DialogService.dart';
import 'package:ezzy/widgets/PostListView/PostListViewWidget.dart';
import 'package:ezzy/widgets/PostListView/PostListViewWidgetViewModel.dart';
import 'package:get_it/get_it.dart';
import 'package:ezzy/services/DatabaseService.dart';
import 'package:ezzy/services/NavigationService.dart';

GetIt locator = GetIt.instance;

void setupLocator () {
  //Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => DialogService());

  //Views
  //locator.registerFactoryParam<PostListViewWidget, postTag, void>((tag,_) => PostListViewWidget(tag:tag));

  //ViewModels
  locator.registerFactoryParam<PostListViewWidgetViewModel, postTag, void>((tag,_) => PostListViewWidgetViewModel(tag:tag));
  locator.registerFactoryParam<ProfileViewModel, String, void>((uid,_) => ProfileViewModel(uid:uid));
}