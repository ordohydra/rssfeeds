import 'package:flutter/material.dart';
import 'package:xml/xml.dart';
import 'package:rssfeeds/Model/feed_item.dart';

List<FeedItem> parseDocument(XmlDocument document) {
  final rssNode = document.findAllElements("rss").firstOrNull;
  if (rssNode == null) {
    throw ErrorDescription('Parsing error – no rss node');
  }

  final xmlItems = rssNode.findAllElements("item");
  final items = xmlItems.nonNulls.map((xmlItem) => parseElement(xmlItem));

  return items.nonNulls.toList();
}

FeedItem? parseElement(XmlElement element) {
  final title =
      element.findAllElements('title').firstOrNull?.children.firstOrNull?.value;
  final text = element
      .findAllElements('description')
      .firstOrNull
      ?.children
      .firstOrNull
      ?.value;

  final urlStr =
      element.findAllElements('link').firstOrNull?.children.firstOrNull?.value;
  if (urlStr == null) {
    return null;
  }

  final url = Uri.parse(urlStr);
  if (title == null || text == null) {
    return null;
  }

  return FeedItem(title: title, textContent: text, url: url);
}
