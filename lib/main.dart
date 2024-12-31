import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //splash를 메인에서 처리하기 위해 변경
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);   /// 네이티브 화면을 보전하고 유지하는 역할, 지워주는 타이밍은  s_main.dart에서 하게 됨
  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();
  timeago.setLocaleMessages('ko', timeago.KoMessages()); //몇시간전에 를 위한 세팅값으로 보통 메인에 설치, 앱전체에서 사용한다.,,한글버전으로 설치
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: false,
      child: const App()));
}
