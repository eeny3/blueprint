import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/ui/auth_screen/auth_screen.dart';
import 'package:one_trade/ui/base/material_message_controller.dart';
import 'package:one_trade/ui/main/main_screen.dart';
import 'app_wm.dart';

const String fontFamily = 'Exo2';

class App extends ElementaryWidget<IAppWidgetModel> {
  const App({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAppWidgetModel wm) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      useInheritedMediaQuery: true,
      builder: (context, snapshot) {
        return MaterialApp(
          scaffoldMessengerKey: MaterialMessageController.scaffoldMessengerKey,
          theme: ThemeData(fontFamily: fontFamily),
          //TODO pin_code page
          home: wm.isAuthenticated ? MainScreen() : const AuthScreen(),
        );
      },
    );
  }
}
