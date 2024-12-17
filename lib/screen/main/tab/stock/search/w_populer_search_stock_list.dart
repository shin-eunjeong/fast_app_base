import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dumy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            '인기 검색'.text.bold.make(),
            emptyExpanded,
            '오늘 ${DateTime.now().formattedTime} 기준'.text.size(12).make(),
          ],
        ),
        height20,
        // 리스트 index를 사용할 수 있는 mapIndexed함수로 사용함.
        ...popularStockList.mapIndexed((element,index)=> PopularStockItem(stock:element,number: index+1)).toList(),
      ],
    ).pSymmetric(h: 20);
  }
}
