import 'dart:math';

import 'package:rssfeeds/Services/Feed/feed_parser.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('Test xml feed parser', () {
    test('Single item should be parsed correcly', () {
      final document = XmlDocument.parse("""
<test>
  <title>Test title</title>
  <description>Test text</description>
</test>""");
      final item = parseElement(document.rootElement);
      if (item == null) {
        fail("Xml item is null");
      }
      expect(item.title, 'Test title');
      expect(item.textContent, 'Test text');
    });

    test('RSS document should be parsed correcly', () {
      final document = XmlDocument.parse("""
<rss>
<item>
  <title>Test title 1</title>
  <description>Test text</description>
</item>
<item>
  <title>Test title 2</title>
  <description>Test text</description>
</item>
</rss>
""");
      final items = parseDocument(document);
      expect(items.length, 2);
      expect(items[0].title, 'Test title 1');
      expect(items[1].title, 'Test title 2');
    });
  });
}
