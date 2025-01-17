import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/Services/Network/network_service_api.dart';
import 'package:rssfeeds/Services/Feed/feed_service_impl.dart';
import 'package:rssfeeds/Services/Network/network_service_impl.dart';
import 'package:rssfeeds/main.dart';

final class AppScopeLifecycle implements RssFeedAppWidgetDepsProvider {
  final FeedServiceApi feedService;
  final NetworkServiceAPI networkService;
  AppScopeLifecycle({required this.feedService, required this.networkService});

  factory AppScopeLifecycle.init() {
    final networkService = NetworkServiceImpl();
    final feedbackService = FeedServiceImpl(networkService: networkService);

    return AppScopeLifecycle(
        feedService: feedbackService, networkService: networkService);
  }

  @override
  FeedServiceApi getFeedService() => feedService;
}
