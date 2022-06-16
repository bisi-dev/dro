import 'package:dro/core/app_export.dart';

class AppTheme {
  late ThemeData lightTheme;

  // Constructs an [AppTheme].
  AppTheme(BuildContext context) {
    lightTheme = ThemeData(
      fontFamily: kFontFamily,
      brightness: Brightness.light,
      primaryColor: kPurple,
      scaffoldBackgroundColor: kAlmostWhite,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xfff5f5f5),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kPurple),

      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        minWidth: 88,
        height: 48,
        padding: EdgeInsets.only(left: kPaddingM, right: kPaddingM),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kBlack,
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        buttonColor: kPurple,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 7,
        color: kPurple,
        iconTheme: IconThemeData(color: kBlack),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
      ),
    );
  }
}