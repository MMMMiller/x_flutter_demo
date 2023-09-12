import 'dart:convert';

import 'package:common_lib/index.dart';

typedef BcJavascriptMessageHandler<T> = void Function(T message);

abstract class BaseScriptChannel<T> {
  JavascriptChannel createJavascriptChannel();

  final String prefix = 'BC_APP_';

  JavascriptChannel createChannel(
    String name,
    BcJavascriptMessageHandler<T> xyJavascriptMessageHandler,
  ) {
    return JavascriptChannel(
      name: prefix + name,
      onMessageReceived: (JavascriptMessage message) {
        final data = message.message;
        final encode = json.decode(data);
        if (!isEmpty(encode)) {
          xyJavascriptMessageHandler(encode);
        }
      },
    );
  }
}
