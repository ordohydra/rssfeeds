import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/FeedItemDetails/rss_feed_item_details_widget.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_event.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_state.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_screen_deps_provider.dart';

class RssFeedScreen extends StatelessWidget {
  final RssFeedScreenDepsProvider depsProvider;
  const RssFeedScreen({super.key, required this.depsProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: _feedItemsBlocBuilder(),
    );
  }

  Widget _feedItemsBlocBuilder() {
    final bloc = RssFeedBloc(depsProvider);
    return BlocBuilder<RssFeedBloc, RssFeedState>(
        bloc: bloc,
        builder: (builderContext, state) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: RssFeedItemDetailsWidget(
                          feedItem: item,
                        ));
                  },
                  itemCount: state.items.length,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 64.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: Text("Refresh"),
                    onPressed: () => bloc.add(RssFeedFetchEvent()),
                  ),
                ),
              )
            ],
          );
        });
  }
}
