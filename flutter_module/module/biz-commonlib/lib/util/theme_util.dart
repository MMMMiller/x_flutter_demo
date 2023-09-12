import 'package:flutter/material.dart';

class ThemeUtil {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  static AppBarTheme getAppBarTheme(BuildContext context) {
    return Theme.of(context).appBarTheme;
  }

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).backgroundColor;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).cardColor;
  }

  static Color getBodyMediumColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.color ??
        getPlaceholderColor(context);
  }

  static IconThemeData getIconTheme(BuildContext context) {
    return Theme.of(context).iconTheme;
  }

  static Color getDividerColor(BuildContext context) {
    return Theme.of(context).dividerColor;
  }

  static Color getPlaceholderColor(BuildContext context) {
    return Theme.of(context).hintColor;
  }

  static Color getDesColor(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium?.color ??
        getPlaceholderColor(context);
  }

  static Color getTitleMediumColor(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.color ??
        getPlaceholderColor(context);
  }

  static Color getTitleColor(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.color ??
        getPlaceholderColor(context);
  }

  static Color getTitle2(BuildContext context) {
    return getPlaceholderColor(context);
  }

  static Color getMediumLabel(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium?.color ??
        getPlaceholderColor(context);
  }

  static Color getBody2(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.color ??
        getPlaceholderColor(context);
  }

  static SwitchThemeData getSwitchThemeData(BuildContext context) {
    return Theme.of(context).switchTheme;
  }

  static DialogTheme getDialogTheme(BuildContext context) {
    return Theme.of(context).dialogTheme;
  }
}
