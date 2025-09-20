import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlideTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn));

    return SlideTransition(position: slideAnimation, child: child);
  }
}
