import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_base/main.dart';
import 'package:flutter_base/screen/loading_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: LoadingScreen, initial: true),
  ],
)
class $MyRouter {}
