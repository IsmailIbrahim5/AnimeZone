
import 'package:flutter/material.dart';

class AnimatedValue<T> extends StatefulWidget {
  final T val;
  final Widget Function(T val) builder;
  final Duration duration;
  final Curve curve;
  const AnimatedValue({super.key, required this.val, required this.builder, required this.duration, this.curve = Curves.linear});

  @override
  State<AnimatedValue<T>> createState() => _AnimatedValueState<T>();
}

class _AnimatedValueState<T> extends State<AnimatedValue<T>> with SingleTickerProviderStateMixin{
  late T val;
  late AnimationController controller;
  late Animation<dynamic> animation;


  @override
  void initState() {
    super.initState();
    val = widget.val;
    controller = AnimationController(vsync: this, duration: widget.duration);

    if(val is Color) {
      animation = ColorTween(begin:val as Color , end: val as Color).animate(CurvedAnimation(parent: controller, curve: widget.curve));
    } else {
      animation = Tween<dynamic>(begin:val , end: val).animate(CurvedAnimation(parent: controller, curve: widget.curve));
    }
  }


  @override
  Widget build(BuildContext context) {
    if(val != widget.val){
      if(widget.val is Color){
        animation = ColorTween(begin: val as Color, end: widget.val as Color).animate(CurvedAnimation(parent: controller, curve: widget.curve));
      }else {
        animation = Tween<dynamic>(begin: val, end: widget.val).animate(
            CurvedAnimation(parent: controller, curve: widget.curve));
      }
      val = widget.val;
      controller.forward(from: 0);
    }
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) =>  widget.builder(animation.value as T));
  }
}
