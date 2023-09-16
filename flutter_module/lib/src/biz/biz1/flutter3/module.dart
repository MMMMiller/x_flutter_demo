// Copyright (c) 2023 foxsofter.
//
// Do not edit this file.
//

import 'package:flutter_thrio/flutter_thrio.dart';

import 'flutter3.page.dart';

class Module with ThrioModule, ModulePageBuilder {
  @override
  String get key => 'flutter3';

  @override
  void onPageBuilderSetting(final ModuleContext moduleContext) =>
      pageBuilder = (final settings) => Flutter3Page(
            moduleContext: moduleContext,
            settings: settings,
          );
}