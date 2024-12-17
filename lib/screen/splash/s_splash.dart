import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';

import 'package:fast_app_base/common/common.dart';

/*로그인들의 별도 화면에서 플러터 엔진안에서 쓸때 사용되는 화면 */
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {  //첫번째 화면이 나타날때
    delay(() {
      Nav.clearAllAndPush(const MainScreen());  //push()는 히스토리가 지워지지않아 스플레시 화면이 나온다. 여기서는 종료되어야 한다.기록남지 않는 back
    }, 1500.ms); // 1.5초 후에 메인화면이 활성화게 작용.
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/image/splash/splash.png",
        width: 192,
        height: 192,
      ),
    );
  }
}
