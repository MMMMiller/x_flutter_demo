import 'package:x_framework/net/exception/api_exception.dart';

class DomainNotToastException extends TransactionException {
  DomainNotToastException(Object message, {int code = -99})
      : super(message, code: code);
}
