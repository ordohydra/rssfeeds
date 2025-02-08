import 'package:flutter/material.dart';
import 'package:rssfeeds/Model/feed_item.dart';
import 'package:webview_flutter/webview_flutter.dart';

final class RssFeedItemReaderWidget extends StatelessWidget {
  final FeedItem feedItem;

  const RssFeedItemReaderWidget({super.key, required this.feedItem});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController();
    controller.loadRequest(feedItem.url);

    return Scaffold(
        appBar: AppBar(
          title: Text(feedItem.title),
        ),
        body: WebViewWidget(controller: controller));
  }
}
