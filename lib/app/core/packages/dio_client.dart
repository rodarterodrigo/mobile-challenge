import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class HttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {Map<String, dynamic> body});
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
  Future<HttpResponse> get(String url) async {
    try {
      final response = await httpClient.get(url);
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioError {
      return HttpResponse(data: '', statusCode: 500);
    }
  }

  @override
  Future<HttpResponse> post(String url,
      {@required Map<String, dynamic> body}) async {
    try {
      final response = await httpClient.post(url, data: body);
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioError {
      return HttpResponse(data: '', statusCode: 500);
    }
  }
}