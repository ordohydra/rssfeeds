import 'package:rssfeeds/Managers/Feed/feed_manager_impl.dart';
import 'package:rssfeeds/Managers/Feed/feed_manager_impl_deps_provider.dart';
import 'package:rssfeeds/Model/feed_item.dart';
import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:test/test.dart';

void main() {
  group('Test feed manager impl', () {
    test('Test feed manager stream update  on fetch call', () async {
      final feedManager = FeedManagerImpl(FeedManaagerImplDepsProviderStub());
      final expectation = [
        '1',
        '2',
      ];
      expectLater(
          feedManager.items().map<String>((items) => items.first.textContent),
          emitsInOrder(expectation));
      feedManager.fetch();
      feedManager.fetch();
    });
  });
}

final class FeedServiceStub implements FeedServiceApi {
  int _counter = 0;
  @override
  Future<List<FeedItem>> fetch() {
    _counter++;
    final item = FeedItem(
        title: "Test title", textContent: "$_counter", url: Uri.parse('test'));
    return Future.value([item]);
  }
}

final class FeedManaagerImplDepsProviderStub
    implements FeedManagerImplDepsProvider {
  @override
  FeedServiceApi getFeedService() {
    return FeedServiceStub();
  }
}
