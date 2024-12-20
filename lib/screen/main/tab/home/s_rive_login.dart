import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/home/w_rive_login_bear.dart';
import 'package:flutter/material.dart';

class ScreenRiveLogin extends StatefulWidget {
  const ScreenRiveLogin({Key? key}) : super(key: key);

  @override
  State<ScreenRiveLogin> createState() => _ScreenRiveLoginState();
}

class _ScreenRiveLoginState extends State<ScreenRiveLogin> {
  final idController = TextEditingController();  //입력값 컨트롤러
  final pwdController = TextEditingController();      //pwd 컨트롤러
  final idFocus =FocusNode();
  final pwdFocus =FocusNode();
  final riveLoginBearController = RiveLoginBearController();
//살재 상태관리를 여기서 하기때문에

  bool check = false;
  bool handsUp = false;
  double look = 0.0;

  @override
  void initState(){
    idController.addListener((){
      setState(() {
        look = idController.text.length.toDouble() * 1.5;
      });
    });

    idFocus.addListener((){
      if (idFocus.hasFocus) {
        setState(() {
          idController.clear(); // ID 입력 필드 초기화
          check = true;
        });
      } else {
        setState(() {
          check = false;
        });
      }
    });
    pwdFocus.addListener(() {
      if (pwdFocus.hasFocus) {
        setState(() {
          pwdController.clear(); // 비밀번호 입력 필드 초기화
          handsUp = true;
        });
      } else {
        setState(() {
          handsUp = false;
        });
      }
    });
    super.initState();
  }
//종료시 wldna.....
  @override
  void dispose() {
    pwdFocus.dispose(); // FocusNode 해제
    pwdController.dispose(); // 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: "로그인".text.make(),
      ),
      body: RoundedContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            'ID와 비밀번호를 입력하세요.'.text.make(),
            SizedBox(
              width: 230,
              height: 230,
              child: RiveLoginBear(
                check: check,
                handsUp: handsUp,
                look: look,
                loginBearController: riveLoginBearController,
              ),
            ),
            height5,
            TextField(
              focusNode: idFocus,
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'ID'
              ),
            ),
            TextField(
              focusNode: pwdFocus,
              obscureText: true,      //비밀번호 *처리
              controller: pwdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'PW'
              ),
            ),
            height10,
            RoundButton(
              text: '로그인',
              onTap: () async {
                final id = idController.text;  //실제값은 text 속성에 있다.
                final pwd = pwdController.text;
                try{
                  riveLoginBearController.runSuccessAnimation();
                  await sleepAsync(10.ms);
                  if (id.isEmpty || pwd.isEmpty) {
                    context.showSnackbar('ID와 비밀번호를 모두 입력해주세요.');
                    return;
                  }
                  context.showSnackbar('id: $id, pwd: $pwd 입니다.');
                }catch(e){
                  riveLoginBearController.runFailAnimation();
                  context.showSnackbar('잘못입력 했어요.....');
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
