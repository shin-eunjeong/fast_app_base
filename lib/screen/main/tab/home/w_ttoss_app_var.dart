import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TtossAppBar extends StatefulWidget {
  static const double appBarHeight = 60; // 여러 파일에서 참조할 화면 높이
  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  //종 알림이 보여줬다 생성되었다 해야함.
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtossAppBar.appBarHeight,
      color: context.appColors.appBarBackGround, //테마에 맞는 색상으로 지정 및 생성함
      child: Row(
        children: [
          width10,
          Image.asset("$basePath/icon/toss.png", height: 30),
          emptyExpanded,
          Image.asset("$basePath/icon/map_point.png", height: 30),
          width10,
          Tap(
            onTap: () {
              /* setState(() {
                _showRedDot = !_showRedDot;
              });*/
              //새로운 화면으로 변경함 241128
              Nav.push(const NotificationScreen());
            },
            child: Stack(
              children: [
                Image.asset("$basePath/icon/notification.png", height: 30),
                if (_showRedDot)
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  )),
              ],
              )       //에니메이션 추가함.....반복 repeat()....then()을통해 여러개 연결
                .animate(onComplete: (controller) => controller.repeat())
                .shake(duration: 2000.ms, hz: 5)
                .then()
                .fadeOut(duration: 1000.ms),
          ),
          width10,
        ],
      ),
    );
  }
}
