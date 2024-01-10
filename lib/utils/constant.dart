import 'package:flutter/widgets.dart';

class Constant {
  // regular = normal, small < regular < big
  static const double fontExtraSmall = 10.0;
  static const double fontSmall = 12.0;
  static const double fontSemiSmall = 14.0;
  static const double fontRegular = 15.0;
  static const double fontSemiRegular = 16.0;
  static const double fontSemiBig = 18.0;
  static const double fontBig = 20.0;
  static const double fontExtraBig = 28.0;
  static const double fontTitle = 24.0;

  static const int blackColorBase = 0xFF191720;
  static const int witheColorNetral = 0xFFFFFFFF;
  static const int blackColorTextFormField = 0xFF1E1C24;
  static const int blackColorborderSide = 0xFF302E37;
  static const int grayColorNetralDark = 0xFF8E8E9B;

  final Size size;

  Constant(BuildContext context) : size = MediaQuery.of(context).size;
}
