import 'package:flutter/material.dart';
import 'package:fast_app_base/common/common.dart';

class RoundedContainer extends StatelessWidget {
  //container 디자인을 반복한다. 패딩은 변할 수 있어 값을주면 적옹, 아니면 기본값
  final Widget child;
  final EdgeInsets padding;
  //박스 둥글기와 배경색도 받을 수 있게 변경
  final double radius;
  final Color? backgroundColor;

  const RoundedContainer(
      {required this.child,
       super.key,
       this.radius =20,
       this.backgroundColor,
       this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor ?? context.appColors.roundedLayoutBackGround,
          borderRadius: BorderRadius.circular(radius)),
      child: child,

    );
  }
}
