//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BasicCircularProgressIndicator extends StatelessWidget {
  //
  //
  //

  final double? minSize;
  final double? maxSize;

  const BasicCircularProgressIndicator({
    super.key,
    this.minSize,
    this.maxSize,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final minSize1 = minSize ?? 32.sc;
    final maxSize1 = maxSize ?? 48.sc;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minSize1,
          minHeight: minSize1,
          maxWidth: maxSize1,
          maxHeight: maxSize1,
        ),
        child: Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
            strokeWidth: 4.sc,
          ),
        ),
      ),
    );
  }
}