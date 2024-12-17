//getController를 구현하는 클래스....get은 상태관리하는 패키지 이다.
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/util/local_json.dart';
import '../vo_simple_stock.dart';
import '../vo_stock.dart';

abstract mixin class SearchStockGetDataProvider{
  late final searchData = Get.find<SearchStockGetData>();
}
class SearchStockGetData extends GetxController {
  /* GetxController를 상속해서 json 데이터를 표시함..  */
  List<SimpleStock> stocks = [];   //stock의 모든 데이터를 갖고 있음
  RxList<String> searchHistoryList = <String>[].obs;   //검색한 기록이 나오는 가로 내역
  RxList<SimpleStock> autoCompleteList =<SimpleStock>[].obs;  //자동완성 하면 나오는 리스트
  // 동적으로 변경되는 데이터를 반영하는 get을 담기위해 List -> RxList로 변경, <String> 타입을 명시해줘야함. 제네릭을 표시 방법인듯

 @override
  void onInit() {
    // TODO: GetxController 생성시 초기화되는 함수
   //시작시 활성화되는 더미데이터를 표시하고
    searchHistoryList.addAll(['삼성전자','LG전자','현대차','넷플릭스']);
    // 이후 json데이터와 연결시킴.
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
   //json 데이터를 변경해줌. json이 반환될때 타입까지 고정해준다.
   final jsonList = await LocalJson.getObjectList<SimpleStock>('json/stock_list.json');
   stocks.addAll(jsonList);
  }

  void search(String keyword){
    if(keyword.isEmpty){
      autoCompleteList.clear();

      return;
    }

    autoCompleteList.value =stocks.where((element) => element.stockName.contains(keyword)).toList();
  }

  void addHistory(SimpleStock stock) {
   searchHistoryList.add(stock.stockName);
  }
  void removeHistory(String stockName){
    //searchHistoryList.removeWhere((element)=>element.id == stockName);
    searchHistoryList.remove(stockName);
  }
}