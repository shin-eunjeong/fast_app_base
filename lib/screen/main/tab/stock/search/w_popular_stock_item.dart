import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../common/common.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;
  const PopularStockItem({super.key, required this.stock, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        number.text.bold.white.size(16).make(),
        width20,
        stock.stockName.text.bold.white.size(16).make(),
        emptyExpanded,
        stock.todayPercentageString.text.color(stock.getPriceColor(context)).size(16).make(),
      ],
    ).pSymmetric(h:20,v: 20);
  }
}
