

import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_interset_stock_list.dart';
import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../../../common/widget/w_arrow.dart';
import '../../../../../common/widget/w_long_button.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyAccount(context),
        height20,
        getMyStocks(context),
      ],
    );
  }

  /*Widget get myAccount => Container(
    //StatelessWidget 은 context를 바로 호출할수 없음. 그래서 함수로 변경함.
    color : context.appColors.roundedLayoutBackGround,
  );*/

  Widget getMyAccount(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color : context.appColors.roundedLayoutBackGround,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      height20,
      '계좌'.text.make(),
      Row(
        children: [
          '443원'.text.size(24).bold.make(),
          const Arrow(),
          emptyExpanded,
          RoundedContainer(
              child:'채우기'.text.size(12).make(),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            radius: 8,
            backgroundColor: context.appColors.buttonBackGround,
          ),
        ],
      ),
      height20,
      Line(color: context.appColors.lessImportant),
      height30,
      LongButton(title: '주문내역', onTap: (){context.showSnackbar('주문내역');},),
      LongButton(title: '판매수익', onTap: (){context.showSnackbar('판매수익');},),

    ],),
  );

  Widget getMyStocks(BuildContext context) => Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color : context.appColors.roundedLayoutBackGround,
        child: Column(
          children: [
            height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              '관심주식'.text.bold.make(),
              '편집하기'.text.color(context.appColors.lessImportant).make(),
              ],
            ),
            height20,
            Tap(
              onTap: (){
                context.showSnackbar('기본');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '기본'.text.make(),
                    Arrow(
                      direction: AxisDirection.up,
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),
      InterestStockList().pSymmetric(),
    ],
  );

}
