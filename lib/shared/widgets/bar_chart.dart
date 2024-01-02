import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_guard/shared/constants.dart';

class BarChartHorizontal extends StatelessWidget {
  const BarChartHorizontal({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: double.infinity,
          height: 2.h,
          child: SizedBox(
            width: fill,
            height: 5.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8),
                ),
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BarChartVertical extends StatelessWidget {
  const BarChartVertical({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(
          width: 2.w,
          height: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8),
              ),
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
