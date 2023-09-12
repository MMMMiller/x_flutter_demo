import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/theme/bc_theme.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends BaseAppBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(BcTheme().lightTheme));
}
