import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

main(){
  //Functional Programming

  //프로그래밍 방법을 부르는 이름들

  //절차적 프로그래밍 - 명령형 프로그래밍
  //함수형 프로그래밍 - 선언형 프로그래밍


}

List<BankAccount> getAccounts(){
  return backAccounts;
}

User getUser(int id) {
  return switch(id){
    1 => User(id, 'Jason'),
    2 => User(id, 'Dart'),
    3 => User(id, 'Baby'),
    4 => User(id, 'Love'),
    5 => User(id, 'Popcorn'),
    _ => throw Exception('404 not found'),
  };

}

class User {
  int id;
  String name;

  User(this.id, this. name) ;

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
