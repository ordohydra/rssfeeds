import 'package:rssfeeds/Model/feed_item.dart';

abstract interface class FeedManagerApi {
  Stream<List<FeedItem>> items();

  void fetch();
}
