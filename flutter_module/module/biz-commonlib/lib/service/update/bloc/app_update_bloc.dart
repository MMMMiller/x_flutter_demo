import 'package:common_lib/index.dart';
import 'package:common_lib/service/package_info/package_info_service.dart';
import 'package:common_lib/service/update/model/app_update_entity.dart';
import 'package:common_lib/service/update/reponsitory/check_update_request.dart';
part 'app_update_event.dart';
part 'app_update_state.dart';

class AppUpdateBloc extends BaseBloc<AppUpdateEvent, AppUpdateState> {
  AppUpdateBloc() : super(AppUpdateInitial());

  void checkUpdate() {
    add(CheckUpdateEvent());
  }

  void checkUpdateAndLoading() {
    add(CheckUpdateLoadingEvent());
  }
}

class AppUpdateViewEvent extends ViewEvent {
  final AppUpdateEntity appUpdateEntity;

  AppUpdateViewEvent(this.appUpdateEntity);
}
