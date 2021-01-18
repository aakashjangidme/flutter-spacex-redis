import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../constants/api_routes.dart';
import 'api_base_helper.dart';
import 'app_exceptions.dart';

class HttpServiceImpl implements HttpService {
  final _log = Logger('ApiBaseHelperImpl');

  //
  @override
  Future<dynamic> get([String url]) async {
    _log.finest('API GET : $url\n');

    var responseJson;
    try {
      final response = await http.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      _log.shout('No Internet connection');

      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> post(String url, dynamic body) async {
    _log.finest('API POST : ${url}\n$body');

    var headers = <String, String>{'Content-Type': 'application/json'};

    var responseJson;
    try {
      final response = await http.post(
        url,
        body: json.encode(body),
        headers: headers,
        encoding: Encoding.getByName('utf-8'),
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      _log.shout('No Internet connection');

      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        _log.finest('API RESPONSE : $responseJson');

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
