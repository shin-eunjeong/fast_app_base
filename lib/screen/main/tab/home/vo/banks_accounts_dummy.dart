/* 임의 데이터 */
import 'package:fast_app_base/screen/main/tab/home/vo/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

import '../../../../../common/constants.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan,3000000, "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(bankShinhan,40000000, "주거래 통장(저축예금)");
final bankAccountShinhan3 = BankAccount(bankShinhan,230000000, "");
final bankAccountKakao1 = BankAccount(bankKakao,2300000,"");
final bankAccountKakao2 = BankAccount(bankKakao,43900000,"입출금 통장");
final bankAccountKakao3 = BankAccount(bankKakao,345620000,"저축 예금");
final bankAccountTtoss1 = BankAccount(bankTtoss,6500000,"");
final bankAccountTtoss2 = BankAccount(bankTtoss,25000000,"보통 예금");
final bankAccountTtoss3 = BankAccount(bankTtoss,710000000,"압류 통장");
final bankAccountInvestment1 = BankAccount(bankInvestment,2000000,"정기 예금");
final bankAccountInvestment2 = BankAccount(bankInvestment,21000000,"보통 예금");
final bankAccountInvestment3 = BankAccount(bankInvestment,350000000,"주거래 통장");
final bankAccountShinhan4 = BankAccount(bankShinhan,345000000,"보통 예금");

main(){
/*
  print("----------------- list 확인");
   for(final item in bankAccounts){
     print(item.accountTypeName);
   }
   print("----------------- map 확인");
   for(final map in bankMap.entries){
     print(map.key + ":" +(map.value.accountTypeName ?? ""));
   }
   print("----------------- set 확인");
   print(bankSet.contains(bankAccountKakao1));

   bankAccounts.toSet(); //리스트를 set으로 변경
  bankSet.toList();; //set을 리스트로 변경
  print("----------------- 형태 변경 확인");
  print(bankAccounts.toSet().contains(bankAccountKakao1));
  print(bankSet.toList());
*/

}

//List<BankAccount>로 하지 않아도 dart가 알아서 list로 읽는다.
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao1,
  bankAccountKakao2,
  bankAccountKakao3,
  bankAccountTtoss1,
  bankAccountTtoss2,
  bankAccountTtoss3,
  bankAccountInvestment1,
  bankAccountInvestment2,
  bankAccountInvestment3,
  bankAccountShinhan4
];
//map
final bankMap ={
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
  "shinhan3": bankAccountShinhan3,
};

//Set 존재하는지 여부 체크를 위해 많이 사용함.
final bankSet = {
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountKakao1,
  bankAccountTtoss1,
  bankAccountKakao2,
  bankAccountKakao3,
};