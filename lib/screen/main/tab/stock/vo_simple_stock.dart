class SimpleStock{
  final String stockName;
  SimpleStock(this.stockName);

  //Local_json.dart에서 오버라이딩한것을 반영할 함수임...
  //factory 는 가공 파라미터로 필요한 생성자를 만들어서 돌려준다.
  factory SimpleStock.fromJson(dynamic json){
    return SimpleStock(json["name"]);
  }

  @override
  String toString() {
    // TODO: implement toString
    return stockName;
  }
}