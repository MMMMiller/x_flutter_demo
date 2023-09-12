/*
 * 项目名:    x_framework
 * 包名       provider_test
 * 文件名:    provider_test
 * 创建时间:  2020/9/18 on 5:19 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:x_framework/net/request_bean.dart';
import 'package:x_framework/provider/x_base_provider_builder.dart';

import 'base_provider.dart';

void main() async {
  TestProvider().load();
  await Future.delayed(Duration(minutes: 1));
}

class Test {}

class TestProvider extends BaseProvider<Test> {
  @override
  RequestBean get requestBean =>
      RequestBean('mall/ad/homePage', params: {}, requestType: RequestType.GET);
}
