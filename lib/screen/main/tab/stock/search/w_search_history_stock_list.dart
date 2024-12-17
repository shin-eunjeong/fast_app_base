import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_stock_detail.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_get_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchHistoryStockList extends StatefulWidget {
  const SearchHistoryStockList({super.key});

  @override
  State<SearchHistoryStockList> createState() => _SearchHistoryStockListState();
}

class _SearchHistoryStockListState extends State<SearchHistoryStockList>
    with SearchStockGetDataProvider {
  //searchData 사용을 위해. SearchStockGetDataProvider 추상화 추가함...
  //검색 기록 창...고정된 사이즈를 남겨두어야 하기 때문에 sizeBox로 지정함.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.only(top:5),
          // 가로 스크롤 이기 때문에 scrollDirection 적용
          scrollDirection: Axis.horizontal,
          itemCount: searchData.searchHistoryList.length,
          itemBuilder: (context, index) {
            final stockName = searchData.searchHistoryList[index];
            return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right:8),
                child: Row(
                  children: [
                    Tap(
                      onTap:(){
                        Nav.push(StockDetailScreen(stockName));
                      },
                      child: stockName.text.make()),
                    Tap(
                      onTap: (){
                        searchData.removeHistory(stockName);
                      },
                      child: Icon(Icons.close)),
                  ],
                ).box.withRounded(value: 6).color(context.appColors.roundedLayoutBackGround).p8.make(),
              ),
            ],
          );
          },
        ),
      ),
    );
  }
}
