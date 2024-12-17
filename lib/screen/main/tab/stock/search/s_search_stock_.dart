import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_get_data.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_populer_search_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_stock_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_serach_auto_complete_list.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_stock_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> with SearchStockGetDataProvider{
  final controller = TextEditingController();
  // text 값을 관리할 컨트롤러 w_stock_searck_app_bar에서 컨트롤할 객체

  //검색데이터는 생성시 들어오는 것이 아니라 필요시 호출되도록 late 선언함.
  //SearchStockGetDataProvider 추상화를 통해 정리함.
  //late final searchData = Get.find<SearchStockGetData>();

  @override
  void initState() {
    //검색화면이 실행시 처음 데이터가 등록되어야 하기 때문에
    Get.put(SearchStockGetData());
    controller.addListener((){
      debugPrint(controller.text);
      //controller가 실행될때마다 해당 함수가 실행된다.
      searchData.search(controller.text);
    });
    // TODO: controller에 데이터가 등록이 되어야 한다.
    super.initState();
  }

  @override
  void dispose() {
    // TODO: 화면이 닫혀지면  검색관련 데이터 삭제도 되어야 한다.
    Get.delete<SearchStockGetData>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //화면에서 키보드 올라오면 세로스크롤이 자동 조절되어야 하기때문에 Scaffold로 선언함.
      appBar : StockSearchAppBar(controller:controller),   // 300개가 넘는 리스트일경우는 ListView.builder를 사용해야함
      body:Obx(()=> searchData.autoCompleteList.isEmpty?    //Obx는 결과를 포함하는 widgex을 돌려주는 함수임./
          ListView(children: const [
            SearchHistoryStockList(),
            PopularSearchStockList()
          ],)
          : SearchAutoCompleteList(controller),
      ),
    );
  }
}

