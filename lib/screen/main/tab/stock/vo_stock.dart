import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stock extends PopularStock {
  final String stockImagePath;

  Stock({
    required this.stockImagePath,
    required super.stockName,
    required super.yesterdayClosePrice,
    required super.currentPrice,
  });


}
