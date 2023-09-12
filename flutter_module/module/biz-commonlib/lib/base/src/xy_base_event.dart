import 'package:common_lib/index.dart';
export 'package:common_lib/persistence/src/xy_exception.dart';

abstract class BizBaseEvent<B, S> extends XBaseEvent<B, S> {
  void handlerNotToastException(Bloc bloc, BaseNetEntity entity) {
    throw DomainNotToastException(entity.message.toString(),
        code: entity.code ?? 0);
  }

  @override
  void handlerException(Bloc bloc, BaseNetEntity entity) {
    super.handlerException(bloc, entity);
  }

  @override
  void handlerLoadException(BaseLoadBloc bloc, BaseNetEntity entity) {
    super.handlerLoadException(bloc, entity);
  }
}
