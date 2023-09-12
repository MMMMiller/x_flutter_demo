import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/common/theme/bc_text_theme.dart';

class BcTheme with UIAdapter {
  ///
  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: ColorsConfig.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        cardColor: Colors.white,
        dividerColor: ColorsConfig.eeeeee,
        hintColor: ColorsConfig.ffc9cdd4,
        disabledColor: ColorsConfig.ffe5e6eb,

        ///
        buttonTheme: BcTextTheme(
          text1: ColorsConfig.ff333333,
          inputBg: ColorsConfig.f9f9fb,
          text2: ColorsConfig.f6c209,
          btnBg: ColorsConfig.ff999999.withOpacity(0.1),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorsConfig.primaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: const IconThemeData(color: ColorsConfig.ff333333),
          titleTextStyle: TextStyle(
            fontSize: sFontSize(36),
            color: ColorsConfig.ff333333,
            fontWeight: FontWeight.w500,
          ),
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
            color: ColorsConfig.ff333333,
            fontWeight: FontWeight.w500,
            fontSize: sFontSize(28),
          ),
          contentTextStyle: TextStyle(
            color: ColorsConfig.fecc2e,
            fontWeight: FontWeight.w500,
            fontSize: sFontSize(28),
          ),
        ),
        iconTheme: const IconThemeData(
          color: ColorsConfig.ff333333,
        ),
        dividerTheme: const DividerThemeData(
          color: ColorsConfig.ffe5e6eb,
        ),
        textTheme: const TextTheme().copyWith(
          titleMedium:
              TextStyle(fontSize: sFontSize(17), color: ColorsConfig.ff1d2129),
          titleLarge:
              TextStyle(fontSize: sFontSize(20), color: ColorsConfig.ff1d2129),
          titleSmall:
              TextStyle(fontSize: sFontSize(12), color: ColorsConfig.ff1d2129),
          bodyMedium:
              TextStyle(fontSize: sFontSize(17), color: ColorsConfig.ff1d2129),
          bodyLarge:
              TextStyle(fontSize: sFontSize(20), color: ColorsConfig.ff1d2129),
          labelSmall:
              TextStyle(fontSize: sFontSize(12), color: ColorsConfig.ffc7ccd5),
          labelMedium:
              TextStyle(fontSize: sFontSize(14), color: ColorsConfig.ff86909c),
          labelLarge:
              TextStyle(fontSize: sFontSize(17), color: ColorsConfig.ffc7ccd5),
          bodySmall:
              TextStyle(fontSize: sFontSize(12), color: ColorsConfig.ff1d2129),
          headlineSmall:
              TextStyle(fontSize: sFontSize(12), color: ColorsConfig.ff1d2129),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: ColorsConfig.eeeeee,
          labelStyle: TextStyle(
            color: ColorsConfig.ff333333,
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.all<Color>(ColorsConfig.e5e5e5),
          thumbColor: MaterialStateProperty.all<Color>(ColorsConfig.e5e5e5),
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        tabBarTheme: const TabBarTheme(
          labelColor: ColorsConfig.primaryColor,
          labelStyle: TextStyle(
            fontSize: 16,
          ),
          unselectedLabelColor: ColorsConfig.ff999999,
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
          ),
        ),
      );

  ///
  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: ColorsConfig.primaryColor,
        scaffoldBackgroundColor: ColorsConfig.ff171717,
        backgroundColor: ColorsConfig.ff171717,
        cardColor: ColorsConfig.ff222222,
        dividerColor: ColorsConfig.ff333333,

        ///
        buttonTheme: BcTextTheme(
          text1: Colors.white,
          inputBg: ColorsConfig.ff222222,
          text2: ColorsConfig.fecc2e,
          btnBg: ColorsConfig.white.withOpacity(0.1),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorsConfig.primaryColor,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: ColorsConfig.ff171717,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontSize: sFontSize(36),
            color: ColorsConfig.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
            color: ColorsConfig.white,
            fontWeight: FontWeight.w500,
            fontSize: sFontSize(28),
          ),
          contentTextStyle: TextStyle(
            color: ColorsConfig.fecc2e,
            fontWeight: FontWeight.w500,
            fontSize: sFontSize(28),
          ),
        ),
        iconTheme: const IconThemeData(
          color: ColorsConfig.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: ColorsConfig.ff171717,
          labelStyle: TextStyle(
            color: ColorsConfig.white,
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.all<Color>(ColorsConfig.ff383838),
          thumbColor: MaterialStateProperty.all<Color>(ColorsConfig.ff383838),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: ColorsConfig.primaryColor,
          labelStyle: TextStyle(
            fontSize: 16,
          ),
          unselectedLabelColor: ColorsConfig.ff999999,
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
          ),
        ),
      );
}
