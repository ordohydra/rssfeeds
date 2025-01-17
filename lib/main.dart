import 'package:flutter/material.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_widget.dart';
import 'package:rssfeeds/app_scope_lifecycle.dart';

void main() {
  final appScopeLifecycle = AppScopeLifecycle.init();

  runApp(RssFeedAppWidget(
    depsProvider: appScopeLifecycle,
  ));
}

class RssFeedAppWidget extends StatelessWidget {
  final RssFeedAppWidgetDepsProvider depsProvider;
  const RssFeedAppWidget({super.key, required this.depsProvider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RSS Feed',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(body: RssFeedWidget(depsProvider: depsProvider)));
  }
}

abstract class RssFeedAppWidgetDepsProvider
    implements RssFeedWidgetDepsProvider {}
