import 'package:fast_app_base/screen/main/tab/stock/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';

class PopularStock extends SimpleStock with StockPercentageDataProvider{
  /*
  * 계산적용 추상화 클래스로 만들어서 해당 클래스에서 구현하는 구조로 하게끔 만듬
  * StockPercentageDataProvider 선언한 변수를 활용한 것임
  * 그냥 선언한 변수였으나 % 계산 자체 추상화 클래스로 만들고 추상화클래스의 변수를 override한것으로 변경함//
  * */
  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;
// 그냥 생성자를 쓰면 차후 생성자 까지 와서 해당 내용이 무엇인지 확인해야 하는 번거로움 때문에 변수를 사용 할수 있는 생성자로 구성함
  PopularStock({required String stockName, required this.yesterdayClosePrice, required this.currentPrice})
  :super(stockName);

}
