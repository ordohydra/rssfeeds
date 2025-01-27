import 'package:rssfeeds/Model/feed_item.dart';
import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_bloc.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_event.dart';
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

final class FeedServiceStub implements FeedServiceApi {
  @override
  Future<List<FeedItem>> fetch() {
    final itemsList = [
      FeedItem(
          title: "Test title",
          textContent: "Test content",
          url: Uri.parse("https://google.com")),
    ];
    return Future.value(itemsList);
  }
}

final class RssFeedBlocDepsProviderStub implements RssFeedBlocDepsProvider {
  @override
  FeedServiceApi getFeedService() => FeedServiceStub();
}
