import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding pad0({Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.zero,
        child: this,
      );

  Padding pad1({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(1),
        child: this,
      );

  Padding pad2({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(2),
        child: this,
      );

  Padding pad4({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(4),
        child: this,
      );

  Padding pad6({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(6),
        child: this,
      );

  Padding pad8({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(8),
        child: this,
      );

  Padding pad12({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(12),
        child: this,
      );

  Padding pad16({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(16),
        child: this,
      );

  Padding pad20({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(20),
        child: this,
      );

  Padding pad24({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(24),
        child: this,
      );

  Padding pad32({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(32),
        child: this,
      );

  Padding pad64({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(64),
        child: this,
      );

  Padding padVer(
    double value, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );

  Padding padHor(
    double value, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  Padding padAll(double value, {Key? key}) {
    return Padding(
      key: key,
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Padding padLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Padding padSymmetric({Key? key, double ver = 0.0, double hor = 0.0}) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: ver,
          horizontal: hor,
        ),
        child: this,
      );

  Padding padOnly({
    Key? key,
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this,
      );
}
