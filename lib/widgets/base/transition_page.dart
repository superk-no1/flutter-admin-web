import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 页面跳转过渡动画
class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required super.child,
    super.key,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideTransitionPage({
    required super.child,
    super.key,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var offsetTween = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            );
            final offsetAnimation = animation.drive(offsetTween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
