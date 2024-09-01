import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final Color color;
  const LoadingWidget({super.key, this.color = Colors.white});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with SingleTickerProviderStateMixin{


  late final Animation<double> animation;
  late final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Center(
      child: SizedBox(
        width: screenSize.width * .1,
        height: screenSize.width * .1,
        child: RotationTransition(
          turns: animation,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/loading.png',
            color: widget.color,
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart);
    controller.repeat();
  }
}
