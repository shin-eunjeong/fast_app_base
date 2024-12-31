import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/search/s_search.dart';
import 'package:fast_app_base/screen/main/tab/todo/s_todo.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/round_button_theme.dart';
import '../../../../common/widget/w_round_button.dart';

class MenuFragment extends StatelessWidget {
  final bool isShowBackButton;

  const MenuFragment({
    Key? key,
    this.isShowBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isShowBackButton) const BackButton(),
            Expanded(
              child: Container(
                color: Colors.green.withOpacity(0.2),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(),
                      RoundButton(
                        text: 'Todo 확인',
                        onTap: () => Nav.push(const TodoScreen(),
                            context: context),
                        theme: RoundButtonTheme.blue,
                      ),
                      height20,
                      RoundButton(
                        text: '검색 보기',
                        onTap: () => Nav.push(const SearchScreen(),
                            context: context),
                        theme: RoundButtonTheme.blue,
                      ),
                      height20,
                      RoundButton(
                        text: '즐겨찾기 화면 띄우기',
                        onTap: () => Nav.push(const MenuFragment(isShowBackButton: true),
                            context: context),
                        theme: RoundButtonTheme.blue,
                      ),
                    ]),

              ),

            )
          ],
        ),
      ),
    );
  }
}
