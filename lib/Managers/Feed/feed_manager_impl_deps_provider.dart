import 'package:rssfeeds/Services/Feed/feed_service_api.dart';

abstract interface class FeedManagerImplDepsProvider {
  FeedServiceApi getFeedService();
}
