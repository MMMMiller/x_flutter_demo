// Copyright (c) 2023 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter_thrio/flutter_thrio.dart';

class Flutter10Route extends NavigatorRouteLeaf {
  factory Flutter10Route(final NavigatorRouteNode parent) =>
      _instance ??= Flutter10Route._(parent);

  Flutter10Route._(super.parent);

  static Flutter10Route? _instance;

  @override
  String get name => 'flutter10';

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
}