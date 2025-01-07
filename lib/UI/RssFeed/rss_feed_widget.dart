import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_event.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_state.dart';
import 'package:rssfeeds/app_scope_container.dart';

class RssFeedWidget extends StatelessWidget {
  final AppScopeContainer scopeContainer;
  const RssFeedWidget({Key? key, required this.scopeContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = RssFeedBloc(scopeContainer);
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
              Align(
                child: FloatingActionButton(
                  child: Text("Refresh"),
                  onPressed: () => bloc.add(RssFeedFetchEvent()),
                ),
              )
            ],
          );
        });
  }
}
