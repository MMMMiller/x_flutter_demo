// Copyright (c) 2022 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter_thrio/flutter_thrio.dart';

import 'biz/module.dart' as biz;
import 'user/module.dart' as user;

class Module
    with
        ThrioModule,
        ModuleJsonDeserializer,
        ModuleJsonSerializer,
        ModuleParamScheme {
  @override
  void onModuleRegister(final ModuleContext moduleContext) {
    navigatorLogEnabled = true;
    registerModule(biz.Module(), moduleContext);
    registerModule(user.Module(), moduleContext);
  }

  @override
  void onParamSchemeRegister(final ModuleContext moduleContext) {}

  @override
  void onJsonSerializerRegister(final ModuleContext moduleContext) {}

  @override
  void onJsonDeserializerRegister(final ModuleContext moduleContext) {}
}
