import 'package:x_framework/base/base_bloc.dart';
import 'package:common_lib/service/multi_data_change/bloc/bloc.dart';

class BcMultiCheckBloc<T>
    extends BaseAppBloc<BcMultiCheckEvent<T>, BcMultiCheckState<T>> {
  final int maxCheckLength;
  final List<T>? initData;

  BcMultiCheckBloc({this.maxCheckLength = 9, this.initData})
      : super(InitialBcMultiCheckState<T>(initData ?? []));

  void addValue(T data) {
    add(AddCheckDataEvent<T>(data));
  }

  bool isContain(T data) {
    return state.checkList.contains(data);
  }

  void removeValue(T data) {
    add(RemoveCheckDataEvent<T>(data));
  }

  void changeData(List<T> list) {
    add(ChangeCheckDataEvent<T>(list));
  }

  void cleanValue() {
    state.checkList.clear();
    add(ChangeCheckDataEvent<T>([]));
  }
}
