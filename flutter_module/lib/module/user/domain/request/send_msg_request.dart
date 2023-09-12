
import 'package:common_lib/index.dart';
import 'package:flutter_module/module/user/domain/request/user_api.dart';
import 'package:flutter_module/module/user/domain/request/user_request.dart';

///文件名:    send_msg_request
///创建时间:  2022/9/13 on 14:55
///描述:
///
///@author   xueml

class SendMsgRequest extends UserRequest {
  final String phone;

  SendMsgRequest(this.phone);

  @override
  RequestBean get requestBean => RequestBean(
        Api.sendForgetPasswordCode,
        params: {
          'phone': phone,
        },
      );
}
