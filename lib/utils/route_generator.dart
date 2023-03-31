import 'package:event_mgmt_sys/models/event.dart';
import 'package:event_mgmt_sys/utils/route_constants.dart';
import 'package:event_mgmt_sys/views/event_detail_page.dart';
import 'package:event_mgmt_sys/views/home_page.dart';
import 'package:event_mgmt_sys/views/login_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case eventDetailRoute:
        final Event args = arguments as Event;
        return MaterialPageRoute(builder: (_) => EventDetailPage(event: args));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
