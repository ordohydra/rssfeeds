import 'package:rssfeeds/Model/feed_item.dart';

abstract interface class RssFeedEvent {}

final class RssFeedFetchEvent implements RssFeedEvent {}

final class RssUpdateFetchEvent implements RssFeedEvent {
  final List<FeedItem> items;
  RssUpdateFetchEvent({required this.items});
}
