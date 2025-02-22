import 'package:flutter/material.dart';
import 'package:rssfeeds/UI/Main/SideBar/main_side_bar_widget.dart';
import 'package:rssfeeds/UI/Main/main_screen_deps_provider.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_screen.dart';

final class MainScreen extends StatelessWidget {
  final MainScreenDepsProvider depsProvider;
  const MainScreen({super.key, required this.depsProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        drawer: MainSideBarWidget(),
        body: RssFeedScreen(depsProvider: depsProvider));
  }
}
