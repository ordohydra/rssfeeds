import 'dart:convert';
import 'dart:io';

import 'network_service_api.dart';
import 'package:xml/xml.dart';

class NetworkServiceImpl extends NetworkServiceAPI {
  final HttpClient _client;
  NetworkServiceImpl() : _client = HttpClient();

  @override
  Future<XmlDocument> fetchFeed(Uri url) async {
    final request = await _client.getUrl(url);
    final response = await request.close();
    final responseData = await response.transform(utf8.decoder).join();

    return XmlDocument.parse(responseData);
  }
}
