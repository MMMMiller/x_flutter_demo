// Copyright (c) 2023 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter/widgets.dart';
import 'package:flutter_thrio/flutter_thrio.dart';

class Flutter6Route extends NavigatorRouteLeaf {
  factory Flutter6Route(final NavigatorRouteNode parent) =>
      _instance ??= Flutter6Route._(parent);

  Flutter6Route._(super.parent);

  static Flutter6Route? _instance;

  @override
  String get name => 'flutter6';

  Future<TPopParams?> push<TParams, TPopParams>({
    final TParams? params,
    final bool animated = true,
    final NavigatorIntCallback? result,
  }) =>
      ThrioNavigator.push<TParams, TPopParams>(
        url: url,
        params: params,
        animated: animated,
        result: result,
      );

  Future<TPopParams?> pushSingle<TParams, TPopParams>({
    final TParams? params,
    final bool animated = true,
    final NavigatorIntCallback? result,
  }) =>
      ThrioNavigator.pushSingle<TParams, TPopParams>(
        url: url,
        params: params,
        animated: animated,
        result: result,
      );

  /// 发送邮箱验证码
  ///
  Future<bool?> sendEmailCode({
    final BuildContext? context,
    required final String email,
    final int? currentFrom,
    final String? coin,
    final String? amount,
    final String? address,
    final String? tag,
  }) =>
      ThrioNavigator.act<Map<String, dynamic>, bool>(
        url: url,
        action:
            'sendEmailCode{context?,email,currentFrom?,coin?,amount?,address?,tag?}',
        params: {
          'context': context,
          'email': email,
          'currentFrom': currentFrom,
          'coin': coin,
          'amount': amount,
          'address': address,
          'tag': tag,
        },
      );
}
