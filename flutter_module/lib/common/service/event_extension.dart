import 'package:todo_flutter/todo_flutter.dart';

/// createTime: 2023/9/15 on 22:12
/// desc:
///
/// @author azhon
extension BaseEventEx<B, S> on BaseEvent<B, S> {
  ///网络结果
  bool isSuccess(BaseBloc bloc, BaseEntity entity) {
    if (entity.code == 200) {
      return true;
    }

    ///网络层问题
    if (entity.code == BaseEntity.defaultCode) {
      throw NetworkException(entity);
    }

    ///服务器接口问题
    throw ApiException(entity);
  }
}
