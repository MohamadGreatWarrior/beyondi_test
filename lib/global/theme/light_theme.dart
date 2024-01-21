import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/global/theme/components/colors.dart';
import 'package:p2p_car_renting/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';
import 'package:p2p_car_renting/global/utils/constants.dart';

final lightTheme = ThemeData(
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: AppColors.mainColor,
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
    ),
    titleLarge: TextStyle(
      color: AppColors.purpleDarkShade,
      height: 1.26,
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
    ),
    titleMedium: TextStyle(
      color: AppColors.purpleDarkShade,
      height: 1.4,
      fontSize: 16.sp,
    ),
    titleSmall: TextStyle(
      color: AppColors.purpleDarkShade,
      fontWeight: FontWeight.w500,
      height: 1.37,
      fontSize: 14.sp,
    ),
    labelLarge: TextStyle(
      fontSize: 14.sp,
      height: 1.48,
      fontWeight: FontWeight.w300,
      color: AppColors.greyShade3,
    ),
    labelMedium: TextStyle(
      fontSize: 16.sp,
      height: 1.4,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      height: 1.25,
      fontSize: 14.sp,
    ),
    bodyMedium: TextStyle(
      color: AppColors.greyShade4,
      height: 1.5,
      fontSize: 14.sp,
    ),
    bodySmall: TextStyle(
      color: AppColors.greyShade4,
      height: 1.48,
      fontSize: 12.sp,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    splashRadius: 2,
    fillColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.mainColor;
        }
        return Colors.white;
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
    side: const BorderSide(
      color: AppColors.greyShade2,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    toolbarTextStyle: TextStyle(
      height: 1.26,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    titleTextStyle: TextStyle(
      height: 1.26,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.mainColor,
    indicatorColor: AppColors.mainColor,
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelColor: AppColors.greyShade4,
    labelStyle: TextStyle(
      fontSize: 14.sp,
      height: 1.4,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.sp,
      height: 1.4,
    ),
  ),
  inputDecorationTheme: _inputDecorationTheme,
  dropdownMenuTheme: const DropdownMenuThemeData(
    inputDecorationTheme: _inputDecorationTheme,
    textStyle: TextStyle(
      color: AppColors.purpleDarkShade,
      height: 1.4,
      fontSize: 16,
    ),
    menuStyle: MenuStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.white),
      elevation: MaterialStatePropertyAll(2),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.radius),
          ),
          side: BorderSide(color: AppColors.greyShade),
        ),
      ),
    ),
  ),
  colorScheme: ColorScheme(
    primary: AppColors.mainColor,
    primaryContainer: AppColors.mainColorShade,
    secondary: AppColors.orangeShade,
    onSecondary: Colors.white,
    onPrimary: Colors.white,
    brightness: Brightness.light,
    background: AppColors.backgroundColor,
    onBackground: Colors.black,
    tertiary: AppColors.purpleDarkShade,
    onTertiary: Colors.white,
    tertiaryContainer: AppColors.greyShade3,
    surface: Colors.white,
    onSurface: AppColors.greyShade,
    surfaceVariant: AppColors.greyShade2,
    onSurfaceVariant: AppColors.greyShade4,
    surfaceTint: AppColors.greyShade2,
    error: AppColors.redShade,
    onError: Colors.white,
    shadow: AppColors.shadow,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColors.greyShade,
      disabledForegroundColor: Colors.white,
      backgroundColor: AppColors.mainColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius10),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: AppColors.blueShade,
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: AppColors.blueShade,
        fontWeight: FontWeight.w600,
        height: 1.15,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius10),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      backgroundColor: Colors.white,
      foregroundColor: AppColors.orangeShade,
      side: const BorderSide(color: AppColors.orangeShade),
    ),
  ),
  extensions: [
    AppThemeExtension.light,
  ],
);

const _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  isDense: true,
  contentPadding: EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(color: AppColors.greyShade),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(width: 1.2, color: AppColors.redShade),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppConstants.radius)),
    borderSide: BorderSide(width: 1.2, color: AppColors.mainColor),
  ),
  hintStyle: TextStyle(color: AppColors.greyShade2, height: 1.48),
  errorStyle: TextStyle(color: AppColors.redShade),
);
