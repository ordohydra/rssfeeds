import 'package:rssfeeds/app_scope_container.dart';
import 'package:yx_scope/yx_scope.dart';

class AppScopeHolder extends ScopeHolder<AppScopeContainer> {
  @override
  AppScopeContainer createContainer() => AppScopeContainer();
}
