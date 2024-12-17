import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/theme/color/dark_app_colors.dart';
import 'package:fast_app_base/screen/notification/d_notification.dart';
import 'package:fast_app_base/screen/notification/notification_dumy.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    //slivers(조각) 활용- 플루터에서 공식 지원 CustomScrollView 사용해야함.
    //테마가 없어서 화면이 깨지기 때문에 Material으로 감쌈
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //가장 나중 선언한게 위에 위치....stack은 반대였음.
          const SliverAppBar(
            title: Text("알림"),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                  NotificationItemWidget(notification: notificationDummies[index],
                  onTap: () {
                    NotificationDialog(notificationDummies[index]).show().then((_){
                      setState(() {}); // then이후는 dialog 닫히면 새로고침을 하는 영역이다.
                    });
                  } ,),
                  childCount: notificationDummies.length,
              )),
        ],
      ),
    );
  }
}
