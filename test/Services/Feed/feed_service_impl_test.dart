import 'package:rssfeeds/Services/Feed/feed_service_impl.dart';
import 'package:rssfeeds/Services/Network/network_service_api.dart';
import 'package:test/test.dart';
import 'package:xml/src/xml/nodes/document.dart';

void main() {
  group('Test feed service impl', () {
    test('Fetched data should be parsed as XML', () async {
      final feedService = FeedServiceImpl(networkService: NetworkServiceStub());
      final items = await feedService.fetch();
      expect(items.length, 2);
      expect(items[0].title, 'Test title 1');
      expect(items[1].title, 'Test title 2');
    });
  });
}

final class NetworkServiceStub implements NetworkServiceAPI {
  @override
  Future<XmlDocument> fetchFeed(Uri url) {
    final document = XmlDocument.parse("""
<rss>
<item>
  <title>Test title 1</title>
  <description>Test text</description>
</item>
<item>
  <title>Test title 2</title>
  <description>Test text</description>
</item>
</rss>
""");
    return Future.value(document);
  }
}
