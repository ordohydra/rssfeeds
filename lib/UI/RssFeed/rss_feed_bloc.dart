import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_event.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_state.dart';
import 'package:bloc/bloc.dart';
import 'package:rssfeeds/app_scope_container.dart';

final class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  late final FeedServiceApi _feedService;
  RssFeedBloc(AppScopeContainer scopeContainer)
      : super(RssFeedState(items: [])) {
    _feedService = scopeContainer.feedServiceDep.get;

    on<RssFeedFetchEvent>((event, emit) async {
      final items = await _feedService.fetch();
      emit(RssFeedState(items: items));
    });
  }
}
