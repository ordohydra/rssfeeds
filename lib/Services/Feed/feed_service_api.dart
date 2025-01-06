import 'package:rssfeeds/Model/feed_item.dart';

abstract interface class FeedServiceApi {
  Future<List<FeedItem>> fetch();
}
