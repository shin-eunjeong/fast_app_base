import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_animated_app_bar.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../common/data/preference/prefs.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

//애니메이션 한개면 SingleTickerProviderStateMixin지만 여러개일때는 TickerProviderStateMixin
class _SettingScreenState extends State<SettingScreen> with TickerProviderStateMixin {
/*
  // 셋팅화면서 변경해야 push 설정값이 반영되면 문제기 때문에 해당 로직은 Prefs 내부에서 구현한다.
  bool isPushOn = false;   //푸쉬 설정값 담을 변수
  @override
  void initState(){
    //기본 셋팅 값을 불러와서 적용해주고 설정화면에서 변경하면 반영된다.
    isPushOn = Prefs.isPushOn.get();
    super.initState();
  }
*/
  //스크롤애니메이션이라 컨트롤 할 객체가 필요함.
  final scrollController = ScrollController();
  late final AnimationController animationController = AnimationController(vsync: this,duration: 2000.ms);

 /*   구현할 수도 있음.
  @override
  void initState(){
    super.initState();
    animationController.addListener((){
    final status = animationController.status;
    switch(status){
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
    }
  });*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //animation적용위해 삭제 및 변경한다.
      //appBar: AppBar(title: '설정'.text.make(),),
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            padding: const EdgeInsets.only(top: 150),  //애니메이션 title 겹쳐서
            children: [
              //Switch Rx 전역 변수를 사용 하기 위해 Obx로 감싼다.
              Obx(() =>
                  SwitchMenu('푸쉬 설정', Prefs.isPushOnRx.get(), onTap: (isOn) {
                    Prefs.isPushOnRx.set(isOn); // 설정값이 반영되는 부분
                    /*
                  Prefs.isPushOn.set(isOn);  // 설정값이 반영되는 부분
                  setState(() {
                  isPushOn = isOn;
                  });   // 전역번수가 되어서 이제 불필요함.
                  */
                  }),
              ),

              //slider  // 이것도 전역변수를 사용하여 어떤 곳에서 변경해도 적용 할수 있음
              Obx(() =>
                  Slider(
                    value: Prefs.sliderPosition.get(),
                    onChanged: (value) {
                      //애니메이션 컨트롤러와 슬라이더 값을 연결시킴.
                      animationController.animateTo(value, duration: 0.ms);
                      Prefs.sliderPosition.set(value);
                      //Prefs.sliderPosition(value);  // 위와 같이 기능임.
                    },
                  )),
              //date time
              Obx(
                  () => BigButton('날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate2}',
                        onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now().subtract(90.days),
                          lastDate: DateTime.now().add(90.days));
                        if(date!=null){
                          Prefs.birthday.set(date);
                        }
                       }),
              ),
              Obx(
                    () => BigButton('저장된 숫자 ${Prefs.number.get()}',
                    onTap: () async {
                      final number = await NumberDialog().show();
                      if(number != null){
                        Prefs.number.set(number);
                      }
                    }),
              ),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('애니메이션 forward', onTap: () async {
                animationController.forward();
              }),
              BigButton('애니메이션 reverse', onTap: () async {
                animationController.reverse();
              }),
              BigButton('애니메이션 refeat', onTap: () async {
                animationController.repeat();
              }),
              BigButton('애니메이션 reset', onTap: () async {
                animationController.reset();
              }),BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),
              BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              }),BigButton('오픈소스 화면', onTap: () async {
                Nav.push(OpensourceScreen());
              })
            ],
          ),
          AnimatedAppBar('설정', scrollController:scrollController, animationController: animationController,), //설정 타이블이 변경되어야 하기 때문에 따로 구현.
        ],
      ),
    );
  }
}
