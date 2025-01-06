import 'package:xml/xml.dart';

abstract interface class NetworkServiceAPI {
  Future<XmlDocument> fetchFeed(Uri url);
}
