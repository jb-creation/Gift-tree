import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
        primaryColor: AppColor.primary,
        primaryColorDark: AppColor.primaryDark,
        cardTheme: cardTheme,
        dividerTheme: dividerTheme,
        fontFamily: kFontFamily,
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: AppColor.primary,
          background: AppColor.white,
          onPrimary: AppColor.white,
          onError: AppColor.red,
          secondary: AppColor.primary,
          onSecondary: AppColor.white,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.primary,
          selectionColor: AppColor.primary.withOpacity(0.3),
          selectionHandleColor: AppColor.primary,
        ),
        elevatedButtonTheme: elevatedButtonTheme,
        scaffoldBackgroundColor: AppColor.scaffoldBackground,
        shadowColor: AppColor.greyLight.withOpacity(0.5),
        dialogTheme: dialogTheme,
        bottomSheetTheme: bottomSheetTheme,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            color: AppColor.textPrimaryLight,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: kFontFamily,
          ),
          errorStyle: const TextStyle(
            color: AppColor.red,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: kFontFamily,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.greyLight),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.greyLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.greyLight),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.primary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.red),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          fillColor: AppColor.white,
          filled: true,
        ),
        radioTheme: radioTheme,
        checkboxTheme: checkBoxTheme,
        bottomAppBarTheme: const BottomAppBarTheme(elevation: 0, color: AppColor.transparent),
      );

  static BottomSheetThemeData get bottomSheetTheme => const BottomSheetThemeData(
        backgroundColor: AppColor.white,
        clipBehavior: Clip.hardEdge,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        modalElevation: 8,
        modalBackgroundColor: AppColor.white,
      );

  static RadioThemeData get radioTheme => RadioThemeData(
        fillColor: MaterialStateProperty.all(AppColor.black),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  static CheckboxThemeData get checkBoxTheme => CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColor.primary),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      );

  static CardTheme get cardTheme => CardTheme(
        elevation: 16,
        shadowColor: AppColor.greyLight.withOpacity(0.5),
        clipBehavior: Clip.hardEdge,
        color: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.zero,
      );

  static DialogTheme get dialogTheme => DialogTheme(
        elevation: 16,
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      );

  static DividerThemeData get dividerTheme => const DividerThemeData(color: AppColor.greyLight, space: 1, thickness: 1);

  static ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) return 4;
            return 0;
          }),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColor.white.withOpacity(0.2);
            } else if (states.contains(MaterialState.hovered) || states.contains(MaterialState.focused)) {
              return AppColor.white.withOpacity(0.1);
            } else {
              return AppColor.transparent;
            }
          }),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
        ),
      );
}
