import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';
/* 상단 첫 박스 라인을 만드는 곳 */
class BigButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const BigButton(this.text, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap,
      child: RoundedContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text.text.white.size(20).bold.make(),
            const Arrow(),
          ],
        ),
      ),
    );
  }
}
