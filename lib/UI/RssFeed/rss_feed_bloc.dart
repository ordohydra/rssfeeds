import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_event.dart';
import 'package:rssfeeds/UI/RssFeed/rss_feed_state.dart';
import 'package:bloc/bloc.dart';

final class RssFeedBloc extends Bloc<RssFeedEvent, RssFeedState> {
  final FeedServiceApi feedService;
  RssFeedBloc({required this.feedService}) : super(RssFeedState(items: [])) {
    on<RssFeedFetchEvent>((event, emit) async {
      final items = await feedService.fetch();
      emit(RssFeedState(items: items));
    });
  }

  // @override
  // Stream<RssFeedState> mapEventToState(RssFeedFetchEvent event) async* {}
}
