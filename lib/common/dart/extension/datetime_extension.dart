import 'package:easy_localization/easy_localization.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);

  String get formattedDate2 => DateFormat('yyyy년 MM월 dd일').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get relativeDays {
    //일정에서 날짜를 계산 반환하는 함수
    final diffDays = difference(DateTime.now().onlyDate).inDays;
    final isNegative = diffDays.isNegative;

    final checkCondition = (diffDays, isNegative);
    return switch (checkCondition) {
      (0, _) => _tillToday,
      (1, _) => _tillTomorrow,
      (_, true) => _dayPassed,
      _ => _dayLeft
    };
  }

  DateTime get onlyDate {
    // 오늘기준으로 날짜 계산
    return DateTime(year, month, day);
  }

  String get _dayLeft => 'daysLeft'
      .tr(namedArgs: {"daysCount": difference(DateTime.now().onlyDate).inDays.toString()});

  String get _dayPassed => 'daysPassed'
      .tr(namedArgs: {"daysCount": difference(DateTime.now().onlyDate).inDays.abs().toString()});

  String get _tillToday => 'tillToday'.tr();

  String get _tillTomorrow => 'tillTomorrow'.tr();

  String get relativeDays2 {
    //기본적으로 timeago 과거 시점만 표기하도록 되어 있음..
    //return timeago.format(this, locale: 'ko'); // 'this'는 DateTime 객체
    final now = DateTime.now();
    final difference = this.difference(now);

    if (difference.inDays == 0 && difference.inHours >= 0) {
      return "오늘"; // 오늘인 경우
    } else if (difference.inDays == 1) {
      return "내일"; // 내일인 경우
    } else if (difference.isNegative) {
      // 과거 날짜의 경우 (timeago 사용)
      return timeago.format(this, locale: 'ko');
    } else {
      // 미래 날짜의 경우 (몇 일 후)
      return "${difference.inDays}일 후";
    }
  }



}
