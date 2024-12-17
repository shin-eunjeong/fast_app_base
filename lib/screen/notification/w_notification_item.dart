import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_row.dart';
import 'package:flutter/material.dart';

class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notification;
  final VoidCallback onTap;

  //반복되는 내용이 있다면 item이란 단어를 사용해서 파일명을 정한다.
  const NotificationItemWidget(
      {required this.onTap, super.key, required this.notification});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {


  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        color: widget.notification.isRead
            ? context.backgroundColor
            : context.appColors.unreadColor, //읽음시 바탕색 변경
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationRow(notification: widget.notification),
            widget.notification.description.text
                .make()
                .pOnly(left: leftPadding + iconWidth)
          ],
        ),
      ),
    );
  }
}

