import 'package:flutter/material.dart';
import 'package:rssfeeds/UI/Main/main_screen.dart';
import 'package:rssfeeds/UI/Main/main_screen_deps_provider.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_screen.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_screen_deps_provider.dart';
import 'package:rssfeeds/app_scope_lifecycle.dart';

void main() {
  final appScopeLifecycle = AppScopeLifecycle.init();

  runApp(AppWidget(
    depsProvider: appScopeLifecycle,
  ));
}

class AppWidget extends StatelessWidget {
  final AppWidgetDepsProvider depsProvider;
  const AppWidget({super.key, required this.depsProvider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'News Feed',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen(depsProvider: depsProvider));
  }
}

abstract class AppWidgetDepsProvider implements MainScreenDepsProvider {}
