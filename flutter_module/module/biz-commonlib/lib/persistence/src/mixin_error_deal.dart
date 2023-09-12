import 'package:x_framework/base/base_net_entity.dart';
import 'package:x_framework/net/exception/exception.dart';

mixin ErrorDeal {
  void _handlerDomainException(DomainException error) {
    if (!handleIsUserNotFound(error)) {}
  }

  DomainException handlerException(BaseNetEntity entity) {
    throw DomainException(entity.message.toString(), code: entity.code ?? -99);
  }

  bool isSuccess(BaseNetEntity entity) {
    return entity.code == 200;
  }

  void dealUserNotFound() async {}

  bool handleIsUserNotFound(DomainException error) {
    if (error.code == -1) {
      dealUserNotFound();
      return true;
    } else {
      return false;
    }
  }
}
