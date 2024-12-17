import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:fast_app_base/screen/notification/w_notification_row.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationDialog extends DialogWidget {
  final TtossNotification notification;

  NotificationDialog(
    this.notification, {
    super.key,
    super.animation = NavAni.Top, //다이얼로그가 위에서 중간까지 떨어지는 느낌
    super.barrierDismissible = false, // 바탕이 선택되지 않도록 막아줌
  });

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {


  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      /*child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NotificationItemWidget(
            notification:widget.notification,
            onTap: () {
              print('wow');
              print(widget.notification.isRead);
              widget.hide();
              setState(() {
                if(widget.notification.isRead ==false){
                  widget.notification.isRead=true;
                  print('변경됨');
                };
              });

              print('확인후');
              print(widget.notification.isRead);
            },

          )
        ],
      ),*/
      child: Align(  //위치를 변경
        alignment: Alignment(0, -0.33),
        child: Container(
        width: 300, // 가로 크기
        //height: 200, // 세로 크기 세로크기를 주지 않으면 자동
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white, // 배경색
          borderRadius: BorderRadius.circular(16), // 둥근 모서리
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4), // 그림자
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Column의 높이를 내부 콘텐츠에 맞게
          children: [
            NotificationRow(notification: widget.notification),
            SizedBox(height: 8), // 간격 추가
            Text(
              widget.notification.description, // 가정: 설명 변수
              style: TextStyle(
                fontSize: 18, // 큰 글자 크기
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // 글자와 버튼사이의 간격 //Spacer(),//세로길이를 자동설정이라서 sizebox로 변경
            ElevatedButton(
              onPressed: () {
                print('wow');
                print(widget.notification.isRead);
                widget.hide();
                setState(() {
                  if (!widget.notification.isRead) {
                    widget.notification.isRead = true;
                    print('변경됨');
                  }
                });
                print('확인후');
                print(widget.notification.isRead);
              },
              child: Text('닫기'),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
