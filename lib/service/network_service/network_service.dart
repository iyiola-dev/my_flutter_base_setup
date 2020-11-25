import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptor.dart';

class NetworkService {
  NetworkService();
  final String baseUrl = "";

  final Client appCLient = HttpClientWithInterceptor.build(
    interceptors: [NetworkInterceptor()],
  );

  Future<dynamic> get(
    String uri, {
    Map<String, String> header,
  }) async {
    try {
      return await appCLient.get(uri, headers: header);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    Map<String, String> header,
    Map<String, dynamic> body,
  }) async {
    try {
      var _body = jsonEncode(body);
      return await appCLient.post(uri, headers: header, body: _body);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> delete(
    String uri, {
    Map<String, String> header,
  }) async {
    try {
      return await appCLient.delete(uri, headers: header);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> patch(
    String uri, {
    Map<String, String> header,
    Map<String, dynamic> body,
  }) async {
    try {
      var _body = jsonEncode(body);

      return await appCLient.patch(uri, headers: header, body: _body);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> put(
    String uri, {
    Map<String, String> header,
    Map<String, dynamic> body,
  }) async {
    try {
      var _body = jsonEncode(body);
      return await appCLient.put(uri, headers: header, body: _body);
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      throw e;
    }
  }
}
