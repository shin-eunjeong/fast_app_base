import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


// 성공 실패 컨트롤러
class RiveLoginBearController {
  late void Function() runSuccessAnimation;
  late void Function() runFailAnimation;
}



// 기본 수업은 w_rive_like_button을 참고
class RiveLoginBear extends StatefulWidget {
  //애니메이션에 필요한 구성값 여기는 다른 함수 호출은 없음.
  final bool check;
  final bool handsUp;
  final double look;
  final RiveLoginBearController loginBearController;

  //
  const RiveLoginBear({
    super.key,
    required this.check,
    required this.handsUp,
    required this.look,
    required this.loginBearController,
  });

  @override
  State<RiveLoginBear> createState() => _RiveLoginBearState();
}

class _RiveLoginBearState extends State<RiveLoginBear> {
  late StateMachineController stateMachineController;
  late SMIBool smiCheck;
  late SMIBool smiHandsUp;
  late SMINumber smiLook;
  //
  late SMITrigger smiSuccess;
  late SMITrigger smiFail;

  @override
  void initState(){
    widget.loginBearController.runSuccessAnimation=(){
      smiSuccess.fire();
    };
    widget.loginBearController.runFailAnimation=(){
      smiFail.fire();
    };

    super.initState();

  }
  @override
  void didUpdateWidget(covariant RiveLoginBear oldWidget) {
    // TODO: implement didUpdateWidget 좋아요 값을 컨드롤 하기 위한함수 , 상위화면에서 setState() 될때 호출
    if (oldWidget.check != widget.check) {
      smiCheck.value = widget.check;
    }
    if (oldWidget.handsUp != widget.handsUp) {
      smiHandsUp.value = widget.handsUp;
    }
    if (oldWidget.look != widget.look) {
      smiLook.value = widget.look;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
        "$baseRivePath/login_screen_character.riv",
        stateMachines: ['State Machine 1'],
        onInit: (Artboard art) {
          stateMachineController =
              StateMachineController.fromArtboard(art, 'State Machine 1')!;
          stateMachineController.isActive = true;
          art.addController(stateMachineController);
          smiCheck = stateMachineController.findInput<bool>('Check') as SMIBool; //Check 기능. 강제 타입변환
          smiHandsUp = stateMachineController.findInput<bool>('hands_up') as SMIBool; //hands_up 기능. 강제 타입변환
          smiLook = stateMachineController.findInput<double>('Look') as SMINumber;   //Look 기능. 강제 타입변환
          smiSuccess = stateMachineController.findInput<bool>('success') as SMITrigger;
          smiFail = stateMachineController.findInput<bool>('fail') as SMITrigger;
        },
      );
  }
}
