import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rssfeeds/Model/feed_item.dart';
import 'package:rssfeeds/UI/RssFeed/FeedItemReader/rss_feed_item_reader_widget.dart';

final class RssFeedItemDetailsWidget extends StatelessWidget {
  final FeedItem feedItem;

  const RssFeedItemDetailsWidget({super.key, required this.feedItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Text(
            feedItem.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Html(data: feedItem.textContent),
        ],
      ),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RssFeedItemReaderWidget(feedItem: feedItem);
      })),
    );
  }
}
