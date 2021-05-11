import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'service/navigation_service.dart';
import 'util/injection.dart';

void main() {
  configureInjection(Env.production);
  WidgetsFlutterBinding.ensureInitialized();

  /// init database and any other setup before runapp
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      builder: BotToastInit(),
      title: 'Flutter Base',
      navigatorKey: NavigationService.navigationKey,
    );
  }
}
