import 'package:bc_user_module/common/api.dart';
import 'package:bc_user_module/common/request.dart';
import 'package:common_lib/index.dart';

///文件名:    send_msg_request
///创建时间:  2022/9/13 on 14:55
///描述:
///
///@author   YHF

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
