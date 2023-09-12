/*
 * 项目名:    x_framework
 * 包名       service.log
 * 文件名:    log
 * 创建时间:  2020/10/15 on 5:59 PM
 * 描述:
 *
 * @author   xueml
 */
import 'package:logger/logger.dart';
import 'package:x_framework/service/log/x_default_log.dart';

class Log {
  static late XDefaultLog _log;

  static init({
    LogFilter? filter,
    LogPrinter? printer,
    LogOutput? output,
  }) {
    _log = XDefaultLog(filter: filter, printer: printer, output: output);
  }

  static void d(dynamic s) {
    _log.logD(s);
  }

  static void e(dynamic s) {
    _log.logE(s);
  }

  static void i(dynamic s) {
    _log.logI(s);
  }

  static void w(dynamic s) {
    _log.logW(s);
  }
}
