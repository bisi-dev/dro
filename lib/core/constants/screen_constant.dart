import 'package:dro/core/app_export.dart';

// App's name
const String kAppName = 'DRO Health';

// App's current version
const String kAppVersion = '1.0.0';

// Theme font
const String kFontFamily = 'Proxima Nova';

// Padding
const double kPaddingS = 10.0;
const double kPaddingSx = 15.0;
const double kPaddingM = 20.0;
const double kPaddingL = 40.0;

// Border Radius
const double kSmallRadius = 8.0;
const double kMediumRadius = 12.0;
const double kLargeRadius = 18.0;

// Screen height
double kScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// Screen width
double kScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// Screen orientation
Orientation kGetOrientation(BuildContext context) {
  return MediaQuery.of(context).orientation;
}