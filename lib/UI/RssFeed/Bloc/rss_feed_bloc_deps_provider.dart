import 'package:rssfeeds/Managers/Feed/feed_manager_api.dart';

abstract interface class RssFeedBlocDepsProvider {
  FeedManagerApi getFeedManager();
}
