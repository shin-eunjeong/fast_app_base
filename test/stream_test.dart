import 'dart:math';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';



void main() {
  ///stream 기본 개념 --동영상 데이터 같이 여러개의 주루룩 들어오는 데이터 --
  ///future 1번의 테이터를 가져옴. Stream은 여러개의 데이터를 받음...


  ///stream 생성과 수행
  ///1. async*  이방식은 잘 안되었음...되다 안되다...했음.
  // print('stream 생성과 수행');
  // countStream(5).listen(
  //   (event) {
  //       print('숫자는 : $event');
  //   },
  //   onError: (error) {
  //     print('에러 발생: $error');
  //   },
  //   onDone: () {
  //     print('스트림 완료');
  //   },
  // );
/*  [1,2,3,4,5].forEach((e){
    print(e);
  });*/

  ///2. streamController
  // print('2. streamController ------');
  // final controller = StreamController<int>();
  // final stream = controller.stream;
  //
  // stream.listen((event){
  //   print('stream : $event');
  // });
  // addDataTotheSink(controller);
  //

  ///stream 데이터 관찰

  ///stream 위젯에서 stream data 표현하기

  ///stream 데이터 관찰2 - BroadcastStream
  // print('stream 데이터 관찰2 - BroadcastStream');
  // final broadCastStream = countStream(4).asBroadcastStream();
  // broadCastStream.listen((e){
  //   print(e);
  // });
  // print('stream 데이터 관찰2 - BroadcastStream**********');
  // Future.delayed(2.seconds, (){
  //   broadCastStream.listen((e){
  //     print('방송 2초 후 : $e');
  //   });
  // });

  ///2개의 위젲에서 하나의 BroadcastStream data 표현하기

  /// stream error handling
  print('stream error handling -**********');
  countStream(5).listen((e){
    print('eee : $e');
  }).onError((error,trace){
    print('에러는 : $error');
  });


}

//2. controller방식 예제
void addDataTotheSink(StreamController<int> controller) {
  for(int i=1; i<=4 ; i++){
    print('before add sink');
    controller.sink.add(i);
    print('after add sink');

    //Future.delayed(1.seconds, (){});
    sleepAsync(3.seconds);
  }
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}

//sleepAsync 들어가면 출력이 안됨.
Stream<int> countStream(int max) async*{
  //async* 붙이면 stream이됨....안붙이면 future임...
  for(int i=1 ; i<=max; i++){
    if(i==2){
      yield* Stream.error(Exception('에러발생'));// 계속 이어나가려면 * 기호 붙이면 됨.
    }
    // return 이 아니라 생산하다란 뜻이 있는 yield로 반환해야함.
    yield i;
    //sleepAsync(2.seconds); // 속도는 아무것도 await를 붙이는 순간 아무것도 안됨.......현제는 제거

  }
}
//test에서 sleepAsync 만들어본 함수이나 역시 안되었음.
/*void addDataTotheSink(StreamController<int> controller) {
  int i = 1;
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (i <= 4) {
      print('before add sink');
      controller.sink.add(i);
      print('after add sink');
      i++;
    } else {
      timer.cancel();
      controller.close(); // 스트림 종료
    }
  });
}*/
