import 'package:flutter_module/common/api/api_provider.dart';
import 'package:flutter_module/module/user/domain/request/user_api.dart';
import 'package:todo_flutter/todo_flutter.dart';

///文件名:    send_msg_request
///创建时间:  2022/9/13 on 14:55
///描述:
///
///@author   xueml

class SendMsgRequest extends ApiRequest {
  final String phone;

  SendMsgRequest(this.phone)
      : super({
          'phone': phone,
        });

  @override
  RequestMethod get method => RequestMethod.get;

  @override
  String get url => Api.sendForgetPasswordCode;
}
