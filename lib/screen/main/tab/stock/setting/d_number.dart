import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:fast_app_base/screen/notification/w_notification_row.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

class NumberDialog extends DialogWidget<int?> {     //DialogWidget<int?> 반환값이 int라는 선언

  NumberDialog(
      {
        super.key,
        super.animation = NavAni.Fade, //다이얼로그가 자연스럽게 보여주는 fade
        super.barrierDismissible = false, // 바탕이 선택되지 않도록 막아줌
      });

  @override
  DialogState<NumberDialog> createState() => _NumberDialog();
}

class _NumberDialog extends DialogState<NumberDialog> {

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Column의 높이를 내부 콘텐츠에 맞게
          children: [
            RoundedContainer(
                child: Column(
                  children: [
                    '숫자를 입력해주세요.'.text.make(),
                    TextField(controller: controller, keyboardType: TextInputType.number,),  // 키보드 타입 지정
                    height5,
                    RoundButton(text: '완료', onTap: (){
                      final text = controller.text;
                      int number = int.parse(text);
                      widget.hide(number);  //결과값 넘겨주기
                    }).p(10)
                  ],
            ))
          ],
        ),
    );
  }
}
