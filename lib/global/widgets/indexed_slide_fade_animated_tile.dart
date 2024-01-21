import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class IndexedSlideFadeAnimatedTile extends StatelessWidget {
  const IndexedSlideFadeAnimatedTile({
    super.key,
    required this.index,
    required this.child,
  });

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 350),
      delay: const Duration(milliseconds: 200),
      child: SlideAnimation(
        horizontalOffset: 100.w,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
