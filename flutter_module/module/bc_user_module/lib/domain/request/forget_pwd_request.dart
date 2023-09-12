import 'package:bc_user_module/common/api.dart';
import 'package:bc_user_module/common/request.dart';
import 'package:common_lib/index.dart';

///文件名:    send_msg_request
///创建时间:  2022/9/13 on 14:55
///描述:
///
///@author   YHF

class ForgetPwdRequest extends UserRequest {
  final String confirmPassword;
  final String password;
  final String phone;
  final String verificationCode;

  ForgetPwdRequest(
      this.confirmPassword, this.password, this.phone, this.verificationCode);

  @override
  RequestBean get requestBean => RequestBean(
        Api.forgetPassword,
        params: {
          'confirmPassword': confirmPassword,
          'password': password,
          'phone': phone,
          'verificationCode': verificationCode,
        },
      );
}
