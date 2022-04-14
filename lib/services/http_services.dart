import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpServices{
  String url = kReleaseMode ? 'https://erapid.herokuapp.com/erapid/' : 'http://localhost:8090/erapid/';

  Future<Map> httpPost(String method, var jsonReq) async {
    Response response;
    url = url+method;

    BaseOptions options = BaseOptions(
      baseUrl: url,
      connectTimeout: 6000,
      receiveTimeout: 120000,
      followRedirects: false,
      validateStatus: (status) {
        return (status ?? 0) < 500;
      },
      headers: {
        'content-type': 'application/json'
      },
    );

    Dio dio = Dio(options);

    try {
      response = await dio.post("", data: json.encode(jsonReq));
    } on TimeoutException catch (e) {
      //Timeout Exception
      return {
        'rc': '902',
        'rcm': "Gagal timeout - ${e.message} - URL: $url"
      };
    } on SocketException catch (e) {
      print(e);
      //Socket Exception
      return {
        'rc': '903',
        'rcm': "Gagal koneksi - ${e.message} - URL: $url"
      };
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        return {
          'rc': '902',
          'rcm': "Gagal Konek Timeout - ${e.message} - URL: $url"
        };
      } else if (e.type == DioErrorType.receiveTimeout) {
        return {
          'rc': '902',
          'rcm': "Gagal Read Timeout - ${e.message} - URL: $url"
        };
      } else if (e.type == DioErrorType.other) {
        return {
          'rc': '901',
          'rcm': "Gagal Lainnya - ${e.message} - URL: $url"
        };
      } else {
        return {
          'rc': '903',
          'rcm': "Gagal Lainnya - ${e.message} - URL: $url"
        };
      }
    } on Exception catch (e) {
      print(e);
      //Default Exception
      return {'rc': '903', 'rcm': "Gagal Lainnya -  - URL: $url"};
    }

    if (response.statusCode != 200) {
      return {'rc': '904', 'rcm': "Gagal Lainnya -  - URL: $url"};
    }

    try {
      Map jsonResp = response.data;

      return jsonResp;
    } on Exception catch (e) {
      return {
        'rc': '904',
        'rcm': "Gagal json - $e - URL: $url"
      };
    }
  }
}