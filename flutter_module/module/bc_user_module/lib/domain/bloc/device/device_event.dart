part of 'device_bloc.dart';

@immutable
abstract class DeviceEvent extends YBaseEvent<DeviceBloc, DeviceState> {
  DeviceEvent();
}

class ChangeDeviceUserEvent extends DeviceEvent {

  final String loseTime;
  ChangeDeviceUserEvent(this.loseTime);

  @override
  Stream<DeviceState> applyAsync(
      DeviceBloc bloc, DeviceState currentState) async* {
    // final deviceId = await bloc._xiaomiPlugin.getDeviceId();
    final deviceId = '12121';
    if (!isEmptyString(deviceId)) {
      await DeviceRequest(deviceId,loseTime).load();
    }
    yield currentState;
  }
}
