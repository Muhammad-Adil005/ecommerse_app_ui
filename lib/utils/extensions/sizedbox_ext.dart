import 'package:flutter/material.dart';

extension SizedBoxExtension on Widget {
  Widget sizedBoxW(double width, {Key? key}) => SizedBox(
        key: key,
        width: width,
        child: this,
      );

  Widget sizedBoxH(double height) => SizedBox(
        key: key,
        height: height,
        child: this,
      );

  Widget sizedBox({
    required double w,
    required double h,
  }) =>
      SizedBox(
        key: key,
        width: w,
        height: h,
        child: this,
      );

  Widget sizedBoxSq(double val) => SizedBox(
        key: key,
        width: val,
        height: val,
        child: this,
      );
}

extension SizeExtension on num {
  Widget get h => SizedBox(height: toDouble());

  Widget get w => SizedBox(width: toDouble());
}
