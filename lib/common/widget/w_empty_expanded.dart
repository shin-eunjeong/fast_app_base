import 'package:flutter/material.dart';
//반복될것이라 호출하는 식을 만들어 놈
const emptyExpanded = EmptyExpanded();

class EmptyExpanded extends StatelessWidget {
  final int flex;

  const EmptyExpanded({Key? key, this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }
}
