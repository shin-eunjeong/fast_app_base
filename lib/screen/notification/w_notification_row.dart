import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationRow extends StatelessWidget {
  const NotificationRow({
    super.key,
    required this.notification,
  });

  final TtossNotification notification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Width(leftPadding),
        Image.asset(
          notification.type.iconPath,
          width: iconWidth,
        ),
        notification.type.name.text
            .size(12)
            .color(context.appColors.lessImportant)
            .make(),
        emptyExpanded,
        timeago
            .format(notification.time,
            locale: context.locale.languageCode)
            .text
            .size(13)
            .color(context.appColors.lessImportant)
            .make(),
        width10,
      ],
    );
  }
}
