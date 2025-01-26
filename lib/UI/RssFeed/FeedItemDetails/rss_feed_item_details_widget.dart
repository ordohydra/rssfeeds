import 'package:flutter/material.dart';
import 'package:rssfeeds/Model/feed_item.dart';

final class RssFeedItemDetailsWidget extends StatelessWidget {
  final FeedItem feedItem;

  const RssFeedItemDetailsWidget({super.key, required this.feedItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          feedItem.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(feedItem.textContent)
      ],
    );
  }
}
