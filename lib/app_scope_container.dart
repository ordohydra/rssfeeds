import 'package:rssfeeds/Services/Feed/feed_service_impl.dart';
import 'package:rssfeeds/Services/Network/network_service_impl.dart';
import 'package:yx_scope/yx_scope.dart';

class AppScopeContainer extends ScopeContainer {
  late final networkServiceDep = dep(() => NetworkServiceImpl());
  late final feedServiceDep =
      dep(() => FeedServiceImpl(networkService: networkServiceDep.get));
}
