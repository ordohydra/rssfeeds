import 'package:flutter/material.dart';
import 'package:rssfeeds/Model/feed_item.dart';
import 'package:rssfeeds/Services/Feed/feed_service_api.dart';
import 'package:rssfeeds/Services/Network/network_service_api.dart';
import 'package:xml/xml.dart';

final class FeedServiceImpl implements FeedServiceApi {
  final NetworkServiceAPI networkService;

  FeedServiceImpl({required this.networkService});

  @override
  Future<List<FeedItem>> fetch() async {
    final url = Uri.parse("https://habr.com/ru/rss/articles/?fl=ru");
    final rssXmlDocument = await networkService.fetchFeed(url);
    final items = _parseDocument(rssXmlDocument);

    return items;
  }

  List<FeedItem> _parseDocument(XmlDocument document) {
    final rssNode = document.findAllElements("rss").firstOrNull;
    if (rssNode == null) {
      throw ErrorDescription('Parsing error – no rss node');
    }

    final xmlItems = rssNode.findElements("item");
    final items = xmlItems.nonNulls.map((xmlItem) => _parseElement(xmlItem));

    return items.nonNulls.toList();
  }

  FeedItem? _parseElement(XmlElement element) {
    final title = element.findAllElements('title').firstOrNull?.value;
    final text = element.findAllElements('description').firstOrNull?.value;
    if (title == null || text == null) {
      return null;
    }

    return FeedItem(title: title, textContent: text);
  }
}
