import 'package:rssfeeds/Model/feed_item.dart';
import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/Services/Network/network_service_api.dart';
import 'package:rssfeeds/Services/Feed/feed_parser.dart';

final class FeedServiceImpl implements FeedServiceApi {
  final NetworkServiceAPI networkService;

  FeedServiceImpl({required this.networkService});

  @override
  Future<List<FeedItem>> fetch() async {
    final url = Uri.parse("https://habr.com/ru/rss/articles/?fl=ru");
    final rssXmlDocument = await networkService.fetchFeed(url);
    final items = parseDocument(rssXmlDocument);

    return items;
  }
}
