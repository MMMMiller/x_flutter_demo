import 'package:bc_user_module/common/api.dart';
import 'package:bc_user_module/common/request.dart';
import 'package:common_lib/index.dart';

///文件名:    device_request
///创建时间:  2022/9/24 on 17:06
///描述:
///
///@author   YHF

class DeviceRequest extends UserRequest {
  final String equipmentId;
  final String loseTime;
  DeviceRequest(this.equipmentId,this.loseTime);

  @override
  RequestBean get requestBean => RequestBean(
        Api.equipmentCreate,
        params: {
          'equipmentId': equipmentId,
          'type': 1,
          'loseTime':loseTime
        },
      );
}
