import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class HttpClient {
  Future<Response> get(String url);
  Future<Response> post(String url, {Map<String, dynamic> body});
}

class HttpResponse {
  final String data;
  final int statusCode;

  HttpResponse({@required this.data, @required this.statusCode});
}

class DioClientImplementation implements HttpClient {
  final Dio httpClient;

  DioClientImplementation(this.httpClient);

  @override
  Future<Response> get(String url) async {
    try {
      final response = await httpClient.get(url);
      return Response(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioError {
      return Response(data: '', statusCode: 500);
    }
  }

  @override
  Future<Response> post(String url,
      {@required Map<String, dynamic> body}) async {
    try {
      final response = await httpClient.post(url, data: body);
      return Response(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioError {
      return Response(data: '', statusCode: 500);
    }
  }
}