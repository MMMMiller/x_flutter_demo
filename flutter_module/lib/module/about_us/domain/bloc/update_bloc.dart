import 'package:flutter_module/common/service/event_extension.dart';
import 'package:flutter_module/module/about_us/domain/model/update_info_entity.dart';
import 'package:flutter_module/module/user/domain/bloc/user_info/user_center_bloc.dart';
import 'package:todo_flutter/todo_flutter.dart';

import '../Request/update_info_request.dart';

part 'update_event.dart';

part 'update_state.dart';

class UpdateBloc extends BaseBloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial(null)) {
    _init();
  }

  void _init() {}

  void versionInfoRequest() {
    add(VersionInfoEvent(
      channelCode: 'offcial',
      platform: 'ios',
      tenantAppId: 'e_ant',
      version: '4.11.0',
    ));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
