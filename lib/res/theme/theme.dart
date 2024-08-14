// ignore_for_file: deprecated_member_use

import '../import/import.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
    fontFamily: StringConstants.zojatechFontFamily,
    extensions: [
      ZojatechDesignSystem(
        zojatechGrey: zojatechGrey,
        zojatechBackgroundColor: zojatechBackgroundColor,
        zojatechTextColor: zojatechTextColor,
        containerBg: Colors.white,
      )
    ],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: zojatechBackgroundColor,
    backgroundColor: zojatechBackgroundColor,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // accentColor: Colors.orange,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    focusColor: Colors.blue,
    hoverColor: Colors.grey[200],
    errorColor: Colors.red,
    bottomAppBarTheme: const BottomAppBarTheme(
      surfaceTintColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(
          // color: zojatechGrey.withOpacity(0.5),
          // borderRadius: BorderRadius.circular(8),
          // boxShadow: const [
          //   BoxShadow(
          //     color: zojatechGrey,
          //     blurRadius: 2,
          //   ),
          // ],
          ),
      labelPadding: const EdgeInsets.symmetric(vertical: 8),
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      labelColor: zojatechBlack,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontStyle: FontStyle.normal,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: zojatechWhite,
      surfaceTintColor: Colors.white,
      // brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 16.0,
          color: zojatechTextColor,
          fontWeight: FontWeight.w500),
      headline3: TextStyle(
          fontSize: 16.0, color: zojatechGrey, fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
          fontSize: 12.0,
          color: zojatechTextColor,
          fontWeight: FontWeight.w500),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 10.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 10.0,
        color: zojatechGrey,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        fontSize: 10.0,
        color: zojatechGrey,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontSize: 12.0,
        color: zojatechGrey,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 12.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 12.0,
        color: zojatechGrey,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: zojatechBlack,
      size: 24.0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    extensions: [
      ZojatechDesignSystem(
        zojatechGrey: zojatechGrey,
        zojatechBackgroundColor: zojatechBackgroundColor,
        zojatechTextColor: zojatechTextColor,
        containerBg: zojatechBackgroundColor,
      )
    ],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: zojatechBackgroundColor,
    backgroundColor: zojatechBackgroundColor,
    brightness: Brightness.dark,
    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: zojatechBackgroundColor,
    ),
    primaryColor: Colors.blue,
    // accentColor: Colors.orange,
    canvasColor: Colors.black,
    cardColor: Colors.black,
    dividerColor: Colors.grey,
    focusColor: Colors.blue,
    hoverColor: Colors.grey[200],
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      color: zojatechBackgroundColor,
      // brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 16.0,
          color: zojatechTextColor,
          fontWeight: FontWeight.w500),
      headline3: TextStyle(
          fontSize: 16.0,
          color: zojatechTextColor,
          fontWeight: FontWeight.w500),
      bodyText1: TextStyle(
        fontSize: 12.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 10.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontSize: 10.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        fontSize: 10.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontSize: 12.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontSize: 12.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 12.0,
        color: zojatechTextColor,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: zojatechWhite,
      size: 24.0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
    ),
  );
}

class ZojatechDesignSystem extends ThemeExtension<ZojatechDesignSystem> {
  Color? cardStrokeColor;
  Color? zojatechGrey;
  Color? zojatechBackgroundColor;
  Color? zojatechTextColor;
  Color? zojatechSellColor;
  Color? zojatechFountainblueColor;
  Color? containerBg;

  ZojatechDesignSystem({
    this.cardStrokeColor,
    this.zojatechGrey,
    this.zojatechBackgroundColor,
    this.zojatechTextColor,
    this.zojatechSellColor,
    this.zojatechFountainblueColor,
    this.containerBg,
  });

  @override
  ThemeExtension<ZojatechDesignSystem> copyWith({
    Color? cardStrokeColor,
    Color? zojatechGrey,
    Color? zojatechBackgroundColor,
    Color? zojatechTextColor,
    Color? zojatechSellColor,
    Color? zojatechFountainblueColor,
    Color? containerBg,
  }) {
    return ZojatechDesignSystem()
      ..cardStrokeColor = cardStrokeColor ?? this.cardStrokeColor
      ..zojatechGrey = zojatechGrey ?? this.zojatechGrey
      ..zojatechBackgroundColor =
          zojatechBackgroundColor ?? this.zojatechBackgroundColor
      ..zojatechTextColor = zojatechTextColor ?? this.zojatechTextColor
      ..zojatechTextColor = zojatechTextColor ?? this.zojatechTextColor
      ..zojatechGrey = zojatechGrey ?? this.zojatechGrey
      ..zojatechSellColor = zojatechSellColor ?? this.zojatechSellColor
      ..zojatechGrey = zojatechGrey ?? this.zojatechGrey
      ..zojatechFountainblueColor =
          zojatechFountainblueColor ?? this.zojatechFountainblueColor
      ..containerBg = containerBg ?? this.containerBg;
  }

  @override
  ThemeExtension<ZojatechDesignSystem> lerp(
      covariant ThemeExtension<ZojatechDesignSystem>? other, double t) {
    if (other == null) {
      return this;
    }
    final ZojatechDesignSystem otherDesignSystem =
        other as ZojatechDesignSystem;
    return ZojatechDesignSystem(
      cardStrokeColor:
          Color.lerp(cardStrokeColor, otherDesignSystem.cardStrokeColor, t),
      zojatechGrey: Color.lerp(zojatechGrey, otherDesignSystem.zojatechGrey, t),
      zojatechBackgroundColor: Color.lerp(zojatechBackgroundColor,
          otherDesignSystem.zojatechBackgroundColor, t),
      zojatechTextColor:
          Color.lerp(zojatechTextColor, otherDesignSystem.zojatechTextColor, t),
      zojatechSellColor:
          Color.lerp(zojatechSellColor, otherDesignSystem.zojatechSellColor, t),
      zojatechFountainblueColor: Color.lerp(zojatechFountainblueColor,
          otherDesignSystem.zojatechFountainblueColor, t),
      containerBg: Color.lerp(containerBg, otherDesignSystem.containerBg, t),
    );
  }
}

extension ThemeDataExtension on BuildContext {
  ZojatechDesignSystem? get designSystem =>
      Theme.of(this).extension<ZojatechDesignSystem>();
}
