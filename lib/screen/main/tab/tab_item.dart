import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/f_benefit.dart';
import 'package:fast_app_base/screen/main/tab/home/f_home.dart';
import 'package:fast_app_base/screen/main/tab/menu/f_menu.dart';
import 'package:fast_app_base/screen/main/tab/stock/f_stock.dart';
import 'package:fast_app_base/screen/main/tab/ttosspay/f_ttosspay.dart';
import 'package:flutter/material.dart';

enum TabItem {
  home(Icons.home, '홈', HomeFragment()),
  benefit(Icons.star, '혜택', BenefitFragment()),
  ttosspay(Icons.payment, '토스페이', TtosspayFragment()),
  stock(Icons.candlestick_chart, '주식', StockFragment()),
  all(Icons.menu, '전체', MenuFragment());
//직접 만든 이미지를 넣고 싶다면
//final String activeImagePath; Icon대신 이미지넣고 수정하면됨.
  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {

    return BottomNavigationBarItem(
      icon: Icon(
        key: ValueKey(tabName),
        isActivated ? activeIcon : inActiveIcon,
        color: isActivated
            ? context.appColors.iconButton
            : context.appColors.iconButtonInactivate // 아이콘 색상
      ),
      label: tabName, // 레이블 텍스트  색상의 상단에서 변경한다.
    );
  }
}


