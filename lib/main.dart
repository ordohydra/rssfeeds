import 'package:flutter/material.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_widget.dart';
import 'package:rssfeeds/app_scope_container.dart';
import 'package:rssfeeds/app_scope_holder.dart';

void main() {
  final appScopeHolder = AppScopeHolder();
  appScopeHolder.create();

  if (appScopeHolder.scope == null) {
    throw UnimplementedError();
  }

  runApp(RssFeedAppWidget(
    appScopeContainer: appScopeHolder.scope!,
  ));

  appScopeHolder.drop();
}

class RssFeedAppWidget extends StatelessWidget {
  final AppScopeContainer appScopeContainer;
  const RssFeedAppWidget({super.key, required this.appScopeContainer});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RSS Feed',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(body: RssFeedWidget(scopeContainer: appScopeContainer)));
  }
}
