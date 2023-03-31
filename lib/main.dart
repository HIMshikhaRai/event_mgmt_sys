import 'package:event_mgmt_sys/utils/route_generator.dart';
import 'package:event_mgmt_sys/utils/string_constants.dart';
import 'package:event_mgmt_sys/utils/theme_helper.dart';
import 'package:event_mgmt_sys/view_models/event_view_model.dart';
import 'package:event_mgmt_sys/view_models/login_view_model.dart';
import 'package:event_mgmt_sys/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventViewModel>(
            create: (context) => EventViewModel()),
        ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel()),
      ],
      child: MaterialApp(
        title: appName,
        theme: ThemeHelper.lightTheme,
        darkTheme: ThemeHelper.darkTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
