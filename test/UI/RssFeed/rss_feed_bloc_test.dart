import 'dart:async';

import 'package:rssfeeds/Managers/Feed/feed_manager_api.dart';
import 'package:rssfeeds/Model/feed_item.dart';
import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_bloc_deps_provider.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_event.dart';
import 'package:test/test.dart';

void main() {
  group('Test RSS feed bloc', () {
    test('On receiving fetch event we should receive state with items', () {
      final depsProviderStub = RssFeedBlocDepsProviderStub();
      final bloc = RssFeedBloc(depsProviderStub);
      bloc.stream
          .listen(expectAsync1((value) => expect(value.items.length, 1)));
      bloc.add(RssFeedFetchEvent());
    });
  });
}

final class FeedManagerStub implements FeedManagerApi {
  final _itemStreamController = StreamController<List<FeedItem>>();

  @override
  void fetch() {
    final itemsList = [
      FeedItem(
          title: "Test title",
          textContent: "Test content",
          url: Uri.parse("https://google.com")),
    ];
    _itemStreamController.add(itemsList);
  }

  @override
  Stream<List<FeedItem>> items() {
    return _itemStreamController.stream;
  }
}

final class RssFeedBlocDepsProviderStub implements RssFeedBlocDepsProvider {
  @override
  FeedManagerApi getFeedManager() => FeedManagerStub();
}
