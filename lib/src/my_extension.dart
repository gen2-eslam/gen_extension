import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void push(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  void pushReplacement(Widget page) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (_) => page));

  void pushAndRemoveUntil(Widget page) => Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page), (route) => false);

  void pop() => Navigator.of(this).pop();
}

// convert string to color
extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension GetThemeApp on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  Brightness get brightness => Theme.of(this).brightness;
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Color get primaryColor => colorScheme.primary;
  Color get surfaceColor => colorScheme.surface;
  Color get backgroundColor => colorScheme.background;
  Color get onSurfaceColor => colorScheme.onSurface;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onBackgroundColor => colorScheme.onBackground;
  Color get errorColor => colorScheme.error;
  Color get onErrorColor => colorScheme.onError;
  Color get accentColor => colorScheme.secondary;
  Color get onAccentColor => colorScheme.onSecondary;
  Color get shadowColor => colorScheme.shadow;
}

extension DeviceExtension on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomHeight => MediaQuery.of(this).padding.bottom;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
}

extension KeyBord on BuildContext {
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom != 0;
  bool get isKeyboardHide => MediaQuery.of(this).viewInsets.bottom == 0;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
  double get keyboardHeightWithoutBottom =>
      MediaQuery.of(this).viewInsets.bottom;
}

extension Validate on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
