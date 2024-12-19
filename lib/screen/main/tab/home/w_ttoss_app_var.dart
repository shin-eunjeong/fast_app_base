import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/s_rive_login.dart';
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

  //5번 클릭스 이미지가 커지는 애니매이션을위한 변수
  int _tappingCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TtossAppBar.appBarHeight,
      color: context.appColors.appBarBackGround, //테마에 맞는 색상으로 지정 및 생성함
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          width10,
          //Image.asset("$basePath/icon/toss.png", height: 30) 애니매이션 적용위해 변경 , 이미지속성은 컨테이너가 아니면 내부속성이 안됨...heigh 삭제
          // AnimatedContainer(
          //     duration: 1000.ms,
          //     //시간
          //     //curve: Curves.decelerate, //기본값이 있어서 없어도 됨...
          //     //color: _tappingCount > 3? Colors.red : Colors.blue,  //컬러변경으로 표시할수도 있음
          //     height: _tappingCount > 3 ? 60 : 30,
          //     //시작점과 끝점.
          //     //width:70,),
          //     child: Image.asset("$basePath/icon/toss.png")),
          AnimatedCrossFade(
              firstChild: Image.asset("$basePath/icon/toss.png",height: 30),
              secondChild: Image.asset("$basePath/icon/map_point.png",height: 30),
              crossFadeState: _tappingCount<4? CrossFadeState.showFirst: CrossFadeState.showSecond,       //1,2뭘보여줄것이가 설정..
              duration: 1500.ms),
          _tappingCount.text.make(),
          SizedBox(width: 180,),
          Tap( //로그인 페이지 한번 만들어 봄..
              onTap: () {
                Nav.push(const ScreenRiveLogin());
              },
              child: Icon(size: 30, Icons.person),),
          emptyExpanded,
          //애니매이션 적용을 위해 변경한다.
          //Image.asset("$basePath/icon/map_point.png", height: 30),
          Tap(
              onTap: () {
                setState(() {
                  _tappingCount++;
                });
              },
              onLongPress: (){
                setState(() {
                  _tappingCount--;
                });
              },
              child: Image.asset("$basePath/icon/map_point.png", height: 30)),
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
            ) //에니메이션 추가함.....반복 repeat()....then()을통해 여러개 연결
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
