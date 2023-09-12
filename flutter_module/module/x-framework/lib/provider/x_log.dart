/*
 * 项目名:    flutter_x_framework_test
 * 包名       provider
 * 文件名:    x_log
 * 创建时间:  2020/9/18 on 4:05 PM
 * 描述:
 *
 * @author   xueml
 */

abstract class XLog {
  void logI(dynamic s);

  void logE(dynamic s);

  void logD(dynamic s);

  void logW(dynamic s);

  String get logName;
}
