import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_graphql_task/graphql/graphql_service.dart';

final GetIt di = GetIt.I;
var graphql = di.get<GraphqlService>();

Widget home = const Scaffold();

Future<void> setup() async {
  await _setupConfigs();
  await _setupFactories();
}

Future _setupConfigs() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true
    ..animationStyle = EasyLoadingAnimationStyle.offset
    ..successWidget;
}

Future _setupFactories() async {
  di.registerFactory(() => GraphqlService());
}