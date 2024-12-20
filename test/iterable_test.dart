import 'dart:math';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';



void main() async{

  ///List 와 Iterable
  final List list = ['blue','yellow', 'red'];
  final iterator = list.iterator;  //리스트를 순서대로 할 수 있게 함.
  print(iterator.current);   //현재 값 확인
  print(iterator.moveNext()); //이동후 값이 있는지 확인
  while(iterator.moveNext()){  // 있다면 그값 출력
    print(iterator.current);
  }
  /// sync*로 Iterable만들기
/*  for(final message in countIterable(5)){
    print(message);
  }*/

  /// async*로 Iterable만들기
  await  for (String message in countStream(5)) {
    print(message);
  };

  /// yield*를 통해서 iterable & Stream 연장시키기


}

Iterable<String> countIterable(int max) sync*{
  for (int i = 1; i<=max; i++){
    yield i.toString();
  }
  yield '새해 복 많이 받으세요.';
  yield*['aaa','vvv','eee','gdgd'];
  //yield* countIterable(5)// 무한이 출력이 됨.재귀함수라.
}


Stream<String> countStream(int to) async*{
  for (int i = 1; i <= to; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i.toString();
  }
  yield '새해 복 많이 받으세요.';
  //yield* countStream(3);
  yield* Stream.fromIterable(['aaa1','vvv2','eee3','gdgd4']);
  // Stream일때는 형변환을 해줘야 했음.
}

Future sleepAsync(Duration duration){
  return Future.delayed(duration, () => {});
}