import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';

//사이즈 조절위해 만들었는데 그냥 StatelessWidget 이라  implemenets를 한것임.
class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller; // 검색 인풋을 관리할 controller
  const StockSearchAppBar({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: [
            //뒤로가기 버튼....신규생성화면이라 구성을 모두 만들어 줘야함.
            Tap(
                onTap: () => Nav.pop(context),
                child: const SizedBox(
                  width: 56,
                  height: kToolbarHeight,
                  child: Arrow(
                    direction: AxisDirection.left,
                  ),
                )),
            Expanded(
                child: TextFieldWithDelete(
                controller: controller,
                textInputAction: TextInputAction.search,  //인풋안에 검색 아이콘 넣기
                texthint: "\'커피\'를 검색해보세요.",
                onEditingComplete: (){
                  debugPrint('검색 확인 버튼');
                  AppKeyboardUtil.hide(context);
                },
            ).pOnly(top: 6)),
            width20,
          ],
        ),
      ),
    );
  }

  @override
  // PreferredSizeWidget의 구현체 - 사이즈 정의해야함. 키보드 올라갈때 자동조절
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
