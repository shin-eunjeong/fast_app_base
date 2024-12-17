import 'package:fast_app_base/common/data/preference/item/nullable_preference_item.dart';
import 'package:fast_app_base/common/data/preference/item/preference_item.dart';
import 'package:fast_app_base/common/data/preference/item/rx_preference_item.dart';

import 'package:fast_app_base/common/theme/custom_theme.dart';

import 'item/rxn_preference_item.dart';


class Prefs {
  //static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  static final appTheme = PreferenceItem<CustomTheme>('appTheme', CustomTheme.light);
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);
  /*
  static final isPush1 = PreferenceItem<int>('isPushOn', 10);
  static final isPush2 = PreferenceItem<double>('isPushOn', 22.55);
  static final isPush3 = PreferenceItem<String>('isPushOn', 'value');
  static final isPush4 = NullablePreferenceItem<String>('isPushOn');  // null값이 필요하다면 이렇게 셋팅 가능하다. isPush5.get(); 의 값은 null된다.
  */

  //어느화면에서 설정값을 변경해도 모두 반영할 수 있도록 변경함.
  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOnRx', false);
  static final sliderPosition = RxPreferenceItem<double, RxDouble>('sliderPosition', 0.0);
  //DataTime형식은 구현된게 없고 제네릭 타입으로 만들어 주면됨.
  //기본 셋팅 값이 없기 때문에 null형식으로 잡아줘야 함...  Rxn으로 변경
  static final birthday = RxnPreferenceItem<DateTime, Rxn<DateTime>>('birthday', null );
  // 초기값이 필요한 int형태
  static final number = RxPreferenceItem<int, RxInt>('number', 0);
}
