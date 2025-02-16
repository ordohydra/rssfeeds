import 'dart:async';

import 'package:rssfeeds/Managers/Feed/feed_manager_api.dart';
import 'package:rssfeeds/Managers/Feed/feed_manager_impl_deps_provider.dart';
import 'package:rssfeeds/Model/feed_item.dart';
import 'package:rssfeeds/Services/Feed/feed_service_api.dart';

final class FeedManagerImpl implements FeedManagerApi {
  late final FeedServiceApi _feedService;
  late final StreamController<List<FeedItem>> _itemsStreamController;

  FeedManagerImpl(FeedManagerImplDepsProvider deps) {
    _itemsStreamController = StreamController();
    _feedService = deps.getFeedService();
  }

  @override
  void fetch() async {
    final result = await _feedService.fetch();
    _itemsStreamController.add(result);
  }

  @override
  Stream<List<FeedItem>> items() {
    return _itemsStreamController.stream;
  }
}
