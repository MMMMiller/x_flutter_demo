/// projectName: exiaodian_flutter
/// createTime: 2023/9/16 on 11:57
/// fileName: module
/// desc:
///
/// @author xueml


import 'package:flutter_thrio/flutter_thrio.dart';

import 'biz/module.dart' as biz;

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
  }

  @override
  void onParamSchemeRegister(final ModuleContext moduleContext) {}

  @override
  void onJsonSerializerRegister(final ModuleContext moduleContext) {}

  @override
  void onJsonDeserializerRegister(final ModuleContext moduleContext) {}
}