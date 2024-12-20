import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount {
  final Bank bank;
  //final String accountNumber;
  //final String accountHolderName;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.bank,
    this.balance,
    this.accountTypeName,
  );
  @override
  String toString() {
    return 'BankAccount(bank : $bank, balance: $balance, accountTypeName: $accountTypeName)';
  }
}
