import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*
* * 계산 적용을 여러 화면에서 할경우 분리하는 내용/ 추상화 시켜서 진행하는것을 바탕으로 함.
* */
abstract mixin class StockPercentageDataProvider{
 //추상화에서는 변수가  있다고 가정할 수 있어서 get을 추가 하고 dart가 처리하는 것임.
 int get currentPrice;
 int get yesterdayClosePrice;
  // 차이값을 미리 구현해서 오는 것임
  double get todayPercentage => ((currentPrice-yesterdayClosePrice)/yesterdayClosePrice*100).toPrecision(2);
  String get todayPercentageString =>"${symbol}$todayPercentage%";

  bool get isPlus => currentPrice > yesterdayClosePrice;
  bool get isSame => currentPrice == yesterdayClosePrice;
  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isSame ? "" : isPlus ? "+" : "-";
  Color getPriceColor(BuildContext context)=> isSame? context.appColors.lessImportant: isPlus ? context.appColors.plus: context.appColors.minus;
}