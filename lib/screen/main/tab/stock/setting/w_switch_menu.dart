import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_os_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchMenu extends StatelessWidget {
  final String title;
  final bool isOn;
  final ValueChanged<bool> onTap;  //함수를 의미하게 된다.

  const SwitchMenu(this.title, this.isOn, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      title.text.make(),
      emptyExpanded,
      //os에 따라 변경되는 스위치
      OsSwitch(isOn: isOn, onTap: onTap)

    ],).p20();
  }
}
