import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/memory/todo_data_notifier.dart';
import 'package:fast_app_base/common/theme/custom_theme_app.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/splash/s_splash.dart';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import 'common/data/memory/todo_data_holder.dart';
import 'common/theme/custom_theme.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  ///light, dark 테마가 준비되었고, 시스템 테마를 따라가게 하려면 해당 필드를 제거 하시면 됩니다.
  static const defaultTheme = CustomTheme.light;
  static bool isForeground = true;

  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with Nav, WidgetsBindingObserver {
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  //final notifier = TodoDataNotifier(); //앱 실행시 생성되었다가 닫히면 같이 닫히게 만든다. //getx로 상태관리하면서 삭제

  @override
  void initState() {
    super.initState();
    Get.put(TodoDataHolderGetx());  //instance_manager import했음 getx로 관리하는 일정
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    //notifier.dispose(); getx일 때는 불필요
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomThemeApp(
      child: Builder(builder: (context) {
        return MaterialApp(
          navigatorKey: App.navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Image Finder',
          theme: context.themeType.themeData,
          home: const MainScreen(),
        );
      }),
    );
  }
/*  Widget build(BuildContext context) {  // 일반 상태관리를 할때는 이렇게 했으나...getx로 변경해서 주석처리
    return CustomThemeApp(
      child: Builder(builder: (context) {
        return TodoDataHolder(        //todo 데이터를 불러오기위해 materialApp을 todo dataHolder로 감쌌다.
          notifier:notifier,
          child: MaterialApp(
            navigatorKey: App.navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Image Finder',
            theme: context.themeType.themeData,
            home: const MainScreen(),
          ),
        );
      }),
    );
  }*/
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden: //Flutter 3.13 이하 버전을 쓰신다면 해당 라인을 삭제해주세요.
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
