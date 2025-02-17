import 'package:rssfeeds/Managers/Feed/feed_manager_api.dart';
import 'package:rssfeeds/Managers/Feed/feed_manager_impl.dart';
import 'package:rssfeeds/Managers/Feed/feed_manager_impl_deps_provider.dart';
import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/Services/Network/network_service_api.dart';
import 'package:rssfeeds/Services/Feed/feed_service_impl.dart';
import 'package:rssfeeds/Services/Network/network_service_impl.dart';
import 'package:rssfeeds/main.dart';

final class AppScopeLifecycle implements RssFeedAppWidgetDepsProvider {
  final FeedManagerApi feedManager;
  final NetworkServiceAPI networkService;
  AppScopeLifecycle({required this.feedManager, required this.networkService});

  factory AppScopeLifecycle.init() {
    final networkService = NetworkServiceImpl();
    final feedManagerDeps = FeedManagerImplDepsProviderImpl(
        feedService: FeedServiceImpl(networkService: networkService));
    final feedManager = FeedManagerImpl(feedManagerDeps);
    feedManager.fetch();

    return AppScopeLifecycle(
        feedManager: feedManager, networkService: networkService);
  }

  @override
  FeedManagerApi getFeedManager() => feedManager;
}

final class FeedManagerImplDepsProviderImpl
    implements FeedManagerImplDepsProvider {
  final FeedServiceApi feedService;

  FeedManagerImplDepsProviderImpl({required this.feedService});

  @override
  FeedServiceApi getFeedService() {
    return feedService;
  }
}
