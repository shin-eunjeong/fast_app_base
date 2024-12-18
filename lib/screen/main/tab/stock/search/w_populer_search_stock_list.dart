import 'package:animations/animations.dart';
import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dumy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
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
    '오늘 ${DateTime
        .now()
        .formattedTime} 기준'.text.size(12).make(),
    ],
    ),
    height20,
    // 리스트 index를 사용할 수 있는 mapIndexed함수로 사용함.
    ...popularStockList.mapIndexed((element, index) =>
        //팝업 에니메이션 규축 관련 open(팝업), close(리스트) 셋트임. 테마지정은 안되서 color지정 별도

        OpenContainer<bool>(
          openColor: context.backgroundColor,
          closedColor: context.backgroundColor,
          openBuilder: (BuildContext context, VoidCallback _) {
            return StockDetailScreen(element.stockName);
          },
          closedBuilder: (BuildContext context, VoidCallback action) {
            return Row(
              children: [
                (index+1).text.bold.white.size(16).make(),
                width20,
                element.stockName.text.bold.white.size(16).make(),
                emptyExpanded,
                element.todayPercentageString.text.color(element.getPriceColor(context)).size(16).make(),
                ],
              ).pSymmetric(h:20,v: 20);

          },

        ))
    //애니메이션 넣지 않았을때는 분리하였는데 애니매이션에서는  그냥 안에서 구현했다..
    //PopularStockItem(stock: element, number: index + 1)).toList(),
    ],
    ).pSymmetric(h: 20
    );
  }
}


