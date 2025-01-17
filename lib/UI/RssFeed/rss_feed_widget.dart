import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_event.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_state.dart';
import 'package:rssfeeds/app_scope_lifecycle.dart';

class RssFeedWidget extends StatelessWidget {
  final RssFeedWidgetDepsProvider depsProvider;
  const RssFeedWidget({Key? key, required this.depsProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = RssFeedBloc(depsProvider);
    return BlocBuilder<RssFeedBloc, RssFeedState>(
        bloc: bloc,
        builder: (builderContext, state) {
          return Stack(
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return Text(item.title);
                },
                itemCount: state.items.length,
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

abstract class RssFeedWidgetDepsProvider implements RssFeedBlocDepsProvider {}
