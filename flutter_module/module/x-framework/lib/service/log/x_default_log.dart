/*
 * 项目名:    x_framework
 * 包名       service.log
 * 文件名:    x_log
 * 创建时间:  2020/9/21 on 2:46 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:logger/logger.dart';
import 'package:x_framework/provider/x_log.dart';

class XDefaultLog extends XLog {
  late Logger _log;

  final LogFilter? filter;
  final LogPrinter? printer;
  final LogOutput? output;

  XDefaultLog({this.filter, this.printer, this.output}) {
    _log = Logger(
      filter: filter,
      output: output,
      printer: printer ??
          PrettyPrinter(colors: false, printEmojis: false, printTime: false),
    );
  }

  @override
  void logD(dynamic s) {
    _log.d(s);
  }

  @override
  void logE(dynamic s) {
    _log.e(s);
  }

  @override
  void logI(dynamic s) {
    _log.i(s);
  }

  @override
  String get logName => 'X';

  @override
  void logW(dynamic s) {
    _log.w(s);
  }
}
