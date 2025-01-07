import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_state.dart';
import 'package:rssfeeds/app_scope_container.dart';

class RssFeedWidget extends StatelessWidget {
  final AppScopeContainer scopeContainer;
  const RssFeedWidget({Key? key, required this.scopeContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RssFeedBloc, RssFeedState>(
        bloc: RssFeedBloc(scopeContainer),
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = state.items[index];
              return Text(item.title);
            },
            itemCount: state.items.length,
          );
        });
  }
}
