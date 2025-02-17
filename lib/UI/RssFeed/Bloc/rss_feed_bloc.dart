import 'package:rssfeeds/Managers/Feed/feed_manager_api.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_bloc_deps_provider.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_event.dart';
import 'package:rssfeeds/UI/RssFeed/Bloc/rss_feed_state.dart';
import 'package:bloc/bloc.dart';

final class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  late final FeedManagerApi _feedManager;
  RssFeedBloc(RssFeedBlocDepsProvider depsProvider)
      : super(RssFeedState(items: [])) {
    _feedManager = depsProvider.getFeedManager();

    on<RssFeedFetchEvent>((event, emit) async {
      try {
        _feedManager.fetch();
      } catch (error) {
        print(error);
      }
    });

    on<RssUpdateFetchEvent>((event, emit) async {
      try {
        emit(RssFeedState(items: event.items));
      } catch (error) {
        print(error);
      }
    });

    _feedManager.items().listen((items) {
      add(RssUpdateFetchEvent(items: items));
    });
  }
}
