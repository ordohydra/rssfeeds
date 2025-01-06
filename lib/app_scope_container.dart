import 'package:rssfeeds/Network/network_service_impl.dart';
import 'package:yx_scope/yx_scope.dart';

class AppScopeContainer extends ScopeContainer {
  late final networkServiceDep = dep(() => NetworkServiceImpl());
}
