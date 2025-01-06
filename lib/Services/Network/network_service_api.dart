import 'package:xml/xml.dart';

abstract class NetworkServiceAPI {
  Future<XmlDocument> fetchFeed(Uri url);
}
