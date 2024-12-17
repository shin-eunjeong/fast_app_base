import 'dart:convert';

import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:flutter/services.dart';

import '../../screen/opensource/vo_package.dart';

class LocalJson {
  static Future<T> getObject<T>(String filePath) async {
    final string = await getJsonString(filePath);
    final json = jsonDecode(string);
    return _tryConverting(json);
  }

  static Future<List<T>> getObjectList<T>(String filePath) async {
    final string = await getJsonString(filePath);
    final json = jsonDecode(string);
    if (json is List) {
      return json.map<T>((e) => _tryConverting(e)).toList();
    }
    return [];
  }

  static dynamic getJson(String filePath) async {
    final string = await getJsonString(filePath);
    return jsonDecode(string);
  }

  static Future<String> getJsonString(String filePath) async {
    return await rootBundle.loadString('assets/$filePath');
  }
}
// SimpleStock일 경우로 오버라이딩 생각하면 됨.
T _tryConverting<T>(dynamic json) {
  if (T == SimpleStock) {
    return SimpleStock.fromJson(json) as T;
  } else if (T == Package) {
    return Package.fromJson(json) as T;
  } else {
    throw Exception("Unsupported type: $T");
  }
  /*switch (T) {
    case SimpleStock:
    default:
      return SimpleStock.fromJson(json) as T;
  }*/
  // switch (T) {
  //   case ExampleVO:
  //   default:
  //     return ExampleVO.fromJson(json) as T;
  // }
}
