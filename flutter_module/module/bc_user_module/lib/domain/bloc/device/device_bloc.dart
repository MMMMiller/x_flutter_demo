import 'package:bc_user_module/domain/request/device_request.dart';
import 'package:common_lib/index.dart';
import 'package:date_format/date_format.dart';
part 'device_event.dart';

part 'device_state.dart';

DeviceBloc deviceBloc = DeviceBloc();

class DeviceBloc extends BaseAppBloc<DeviceEvent, DeviceState> {

  DeviceBloc() : super(DeviceInitial()){
  }

  void changeDeviceUser(String? tokenExpireTime) {
    DateTime loseTime;
    if(!isEmptyString(tokenExpireTime) && tokenExpireTime!=''){
      loseTime = DateTime.parse(tokenExpireTime!);
    }else{
      loseTime = DateTime.now().add(const Duration(days:9999));
    }
    final loseTimeStr = formatDate(loseTime, [yyyy,'-',mm,'-',dd,' ',HH,':',nn,':',ss]);
    add(ChangeDeviceUserEvent(loseTimeStr));
  }
}
