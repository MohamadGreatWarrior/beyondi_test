import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/global/theme/theme_x.dart';
import 'package:p2p_car_renting/global/utils/constants.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    this.showHandler = true,
    this.handleSpace = 0,
    this.scrollController,
    this.physics,
    this.padding = EdgeInsets.zero,
    this.boxShadows,
    this.borderRadius = AppConstants.bigRadius,
    required this.child,
  });

  final bool showHandler;
  final double handleSpace;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow>? boxShadows;
  final double borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadows,
        color: context.cs.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        padding: padding,
        physics: physics,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showHandler)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Container(
                      width: 64.w,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: context.cs.onSurface,
                      ),
                    ),
                  ),
                  SizedBox(height: handleSpace),
                ],
              ),
            child,
          ],
        ),
      ),
    );
  }
}
