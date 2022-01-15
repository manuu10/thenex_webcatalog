import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:thenex_webcatalog/model/category/category.dart';
import 'package:thenex_webcatalog/model/product/product.dart';

class HttpService {
  static const api = "http://localhost:5000";
  @protected
  Future<http.Response> requestApi(
    String url, [
    Map<String, String> data = const {},
  ]) async {
    final uri = Uri.parse(api + url);
    Map<String, String> body = {};
    var response = await http.get(uri, headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    return response;
  }

  static final _factories = <Type, Function(Map<String, dynamic>)>{
    Product: (Map<String, dynamic> map) => Product.fromMap(map),
    Category: (Map<String, dynamic> map) => Category.fromMap(map),
  };
  @protected
  Future<List<T>> requestDataList<T>(
    String url, [
    Map<String, String> data = const {},
  ]) async {
    try {
      if (!_factories.keys.contains(T)) {
        return const [];
      }
      final res = await requestApi(url, data);
      if (res.statusCode != 200) {
        print(res.statusCode);
        return const [];
      }
      final body = json.decode(res.body);
      final dataList = body == null
          ? <T>[]
          : List<T>.from(body.map((data) => _factories[T]!(data)));
      return dataList;
    } on Exception catch (e) {
      print(e.toString());

      return const [];
    }
  }
}
