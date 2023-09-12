// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:intl/intl.dart';

class TimeAgo {
  List<String> dayMap() {
    return [
      '昨天',
      '前天',
    ];
  }

  String getYearMounthDateByTimestap(int timeStamp) {
    final formatedTimeStamp = timeStamp * 1000;
    final DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(formatedTimeStamp);
    String month = dateTime.month.toString();
    String date = dateTime.day.toString();
    String hour = dateTime.hour.toString();
    String min = dateTime.minute.toString();
    String sec = dateTime.second.toString();

    return dateTime.year.toString() +
        '年' +
        (month.length == 1 ? '0' : '') +
        month +
        '月' +
        (date.length == 1 ? '0' : '') +
        date +
        '日 ' +
        (hour.length == 1 ? '0' : '') +
        hour +
        ':' +
        (min.length == 1 ? '0' : '') +
        min +
        ':' +
        (sec.length == 1 ? '0' : '') +
        sec;
  }

  List<String> daysMap() {
    return ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六','星期天'];
  }

  List<String> weekdayMap() {
    return ['', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期天'];
  }

  String getYearMounthDate(DateTime dateTime) {
    final String month = dateTime.month.toString();
    final String date = dateTime.day.toString();
    return '${dateTime.year}/${month.length == 1 ? '0' : ''}$month/${date.length == 1 ? '0' : ''}$date';
  }

  String getMounthDate(DateTime dateTime) {
    final String month = dateTime.month.toString();
    final String date = dateTime.day.toString();
    return '${month.length == 1 ? '0' : ''}$month/${date.length == 1 ? '0' : ''}$date';
  }

  String getProductTimeString(String formattedString) {
    final DateTime date = DateTime.parse(formattedString);
    final Duration duration = DateTime.now().difference(
      DateTime(date.year, date.month, date.day),
    );
    final diffDays = duration.inDays;
    if (diffDays < 1) {
      return DateFormat('HH:mm').format(date);
    }
    if (diffDays < 2) {
      return '昨天${DateFormat('HH:mm').format(date)}';
    }
    if (diffDays < 3) {
      return '前天${DateFormat('HH:mm').format(date)}';
    }
    if (date.year == DateTime.now().year) {
      return DateFormat('MM-dd HH:mm').format(date);
    }
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  String getTimeString(String formattedString) {
    final DateTime date = DateTime.parse(formattedString);
    final Duration duration = DateTime.now().difference(date);

    final diffDays = duration.inDays;
    final diffMinutes = duration.inMinutes;
    var res;
    // 一个礼拜之内
    if (diffDays > 0 && diffDays < 7) {
      if (diffDays <= 2) {
        res = dayMap()[diffDays - 1];
      } else {
        res = daysMap()[date.weekday];
      }
    } else if (diffDays > 7) {
      //当年内
      if (date.year == DateTime.now().year) {
        res = getMounthDate(date);
      } else {
        res = getYearMounthDate(date);
      }
    } else {
      if (diffMinutes > 1) {
        if (diffMinutes < 60) {
          final String option2 = diffMinutes.toString();
          res = '$option2分钟前';
        } else {
          final prefix = date.hour > 12 ? '下午' : '上午';
          final timeStr = DateFormat('hh:mm').format(date);
          res = '$prefix $timeStr';
        }
      } else {
        res = '现在';
      }
    }

    return res;
  }

  String getTimeStringForChat(int timeStamp) {
    if (timeStamp == 0) {
      return '';
    }
    final formatedTimeStamp = timeStamp * 1000;
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(formatedTimeStamp);
    final currentDate = DateTime.now();
    final Duration duration = DateTime.now().difference(date);

    final diffDays = duration.inDays;
    final diffMinutes = duration.inMinutes;
    var res;
    if (diffDays <= 0 && date.day != currentDate.day) {
      final prefix = date.hour > 12 ? '下午' : '上午';
      final timeStr = DateFormat('hh:mm').format(date);
      res = '$prefix $timeStr';
      return '昨天$res';
    }
    // 一个礼拜之内
    if (diffDays > 0 && diffDays < 7) {
      if (diffDays <= 2) {
        res = dayMap()[diffDays - 1];
      } else {
        res = daysMap()[date.weekday];
      }
    } else if (diffDays > 7) {
      //当年内
      if (date.year == DateTime.now().year) {
        res = getMounthDate(date);
      } else {
        res = getYearMounthDate(date);
      }
    } else {
      if (diffMinutes > 1) {
        if (diffMinutes < 60) {
          final String option2 = diffMinutes.toString();
          res = '$option2分钟前';
        } else {
          final prefix = date.hour > 12 ? '下午' : '上午';
          final timeStr = DateFormat('hh:mm').format(date);
          res = '$prefix $timeStr';
        }
      } else {
        res = '现在';
      }
    }

    return res;
  }

  String getTimeForMessage(int timeStamp) {
    var nowTime = DateTime.now();
    nowTime = DateTime(nowTime.year, nowTime.month, nowTime.day);
    var ftime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var preFix = ftime.hour >= 12 ? '下午' : '上午';
    final timeStr = DateFormat('hh:mm').format(ftime);
    // 一年外 年月日 + 上/下午 + 时间 (12小时制)
    if (nowTime.year != ftime.year) {
      return '${DateFormat('yyyy-MM-dd').format(ftime)} $preFix $timeStr';
    }
    // 一年内一周外 月日 + 上/下午 + 时间 (12小时制）
    if (ftime.isBefore(nowTime.subtract(const Duration(days: 7)))) {
      return '${DateFormat('MM-dd').format(ftime)} $preFix $timeStr';
    }
    // 一周内一天外 星期 + 上/下午 + 时间 (12小时制）
    if (ftime.isBefore(nowTime.subtract(const Duration(days: 1)))) {
      return '${weekdayMap()[ftime.weekday]} $preFix $timeStr';
    }
    // 昨日 昨天 + 上/下午 + 时间 (12小时制)
    if (nowTime.day != ftime.day) {
      final String option2 = '$preFix $timeStr';
      return '昨天$option2';
    }
    // 同年月日 上/下午 + 时间 (12小时制)
    return '$preFix $timeStr';
  }
}
