import 'package:animezone/config/styles/styles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppTheme extends Equatable{
  late final Color backgroundColor;
  late final Color foregroundColor;
  late final Color bgColor;
  late final  Color titleTextColor;
  late final Color hintTextColor;
  late final Color textColor;
  late final Color primaryColor;
  late final Color accentColor;

  AppTheme.light(){
    bgColor = const Color(0xFFFFFFFF);
    backgroundColor = const Color(0xFFF2F2F2);
    foregroundColor = Colors.white;
    primaryColor = const Color(0xFFF08418);
    accentColor = const Color(0xFFF89B43);
    titleTextColor = blackColor;
    hintTextColor = blackColor.withOpacity(.25);
    textColor = blackColor.withOpacity(.75);
  }

  AppTheme.dark(){
    backgroundColor = const Color(0xFF141414);
    foregroundColor = const Color(0xFF171717);
    bgColor = const Color(0xFF232323);
    primaryColor = const Color(0xFFF08418);
    accentColor = const Color(0xFFF89B43);
    titleTextColor = Colors.white.withOpacity(.9);
    hintTextColor = Colors.white.withOpacity(.18);
    textColor = Colors.white70;
  }

  AppTheme.lerp(AppTheme newTheme, AppTheme oldTheme, double value){
    backgroundColor = Color.lerp(oldTheme.backgroundColor, newTheme.backgroundColor, value)!;
    foregroundColor = Color.lerp(oldTheme.foregroundColor, newTheme.foregroundColor, value)!;
    bgColor = Color.lerp(oldTheme.bgColor, newTheme.bgColor, value)!;
    primaryColor = const Color(0xFFF08418);
    accentColor = const Color(0xFFF89B43);
    titleTextColor = Color.lerp(oldTheme.titleTextColor, newTheme.titleTextColor, value)!;
    hintTextColor = Color.lerp(oldTheme.hintTextColor, newTheme.hintTextColor, value)!;
    textColor = Color.lerp(oldTheme.textColor, newTheme.textColor, value)!;
  }
  @override
  List<Object?> get props => [
    backgroundColor,
    foregroundColor,
    primaryColor,
    accentColor,
    titleTextColor,
    textColor
  ];
}