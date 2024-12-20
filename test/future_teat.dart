
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/banks_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

void main() async{
  //Future의 기본 개념
  /// Future == 미래
  /// 시간이 걸리는 Computation 작업 또는 유저의 응답을 기다려야되는 상태 , 잠시 기다릴 수 있는 상태
  /// 1번의 테이터를 가져옴. Stream은 여러개의 데이터를 받음...

  //Future의 생성과 수행
  ///1. 동기적으로 호출 하는 방법
  print('-------------------- start ');
  //then이라는 함수를 쓰면 future는 value를 반환하고 제네릭 타입을 바로 반환함.
 /* getBankAccounts().then((value){
    print(value.toString());        //BankAccount 및 Back class에 toString이 구현되어 있지 않아서 [Instance of 'BankAccount',  나왔었음...
  });*/
  // 만약 main에 async 를 붙이고 await를 하면 기다리게 됨.
  /*final account = await getBankAccounts();
  print('-------------------- getBankAccounts ');
  print(account.toString());
  print('await ------------------end');
  print('-------------------- end ');
*/
  //Future Timeout
  ///끝나는 시점이 필요할 때
  try{
    final timeOut = await getBankAccounts().timeout(1.seconds);
    print(timeOut);
  }catch(e,stackTrace){
    print(e.toString());
    print(stackTrace);
  }
  /*
  final timeOut = await getBankAccounts().timeout(1.seconds).onError((error, stackTrace) => [
    //에러처리를 할때 반환할 갓은 같은 객체를 반환해야 한다. 에러전의 객체를 반환하는 것은 말이 안됨...ㅠㅠ
    // timeout을 출력해야한 에러가 발생함.
  ]);*/
  //print(timeOut);
  print('end');


  //Future Error handling
  /// catchError형태를 배움. 문제는 이것은 그냥 종료되고 말아버림......객체 받아서 에러날 구석이 없음
  print('에러 핸들링 ---------------');  
  getBankAccounts().timeout(1.seconds).then((value){
    print(value);
  }).catchError((error){ print('에러가 났음.'+ error);});
  print('에러 핸들링 --------------- 끝');
  
  
  //FutrueOr
  /// Futrue거나 아니거나...async하거나 아니거나......
  /// FutrueOr를 쓰면 async를 붙이거나 안붙이거나 모두 구성할수 있다는 건데.....모호한건 실무서 안씀......라이브러리 구성시 필요

}

/*List<BankAccount> getBankAccounts(){
  return bankAccounts;
} async를 붙이면 future형태로 변경되고 이것을 제네럴 타입으로 감싼것
*/
Future<List<BankAccount>> getBankAccounts() async{
  //return null이 될수 있다면 반환 타입을 List<>? 로 변경하면됨.
  await sleepAsync(3.seconds);
  return bankAccounts;
}

Future sleepAsync(Duration duration){
  return Future.delayed(duration, () => {});
}