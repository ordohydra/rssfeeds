import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_event.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_state.dart';
import 'package:bloc/bloc.dart';

abstract interface class RssFeedBlocDepsProvider {
  FeedServiceApi getFeedService();
}

final class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  late final FeedServiceApi _feedService;
  RssFeedBloc(RssFeedBlocDepsProvider depsProvider)
      : super(RssFeedState(items: [])) {
    _feedService = depsProvider.getFeedService();

    on<RssFeedFetchEvent>((event, emit) async {
      try {
        final items = await _feedService.fetch();
        emit(RssFeedState(items: items));
      } catch (error) {
        print(error);
      }
    });
  }
}
