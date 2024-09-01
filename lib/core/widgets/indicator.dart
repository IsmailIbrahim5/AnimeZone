import 'package:flutter/cupertino.dart';

import '../../config/styles/styles.dart';

class Indicator extends StatelessWidget {
  final PageController controller;
  const Indicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.hasClients ? AnimatedBuilder(
      animation: controller,
      builder: (context, child) =>  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) => GestureDetector(
          onTap: () => controller.animateToPage(index , duration: const Duration(milliseconds: 400), curve: Curves.easeOut),
          child: AnimatedContainer(
            key:  ValueKey('circle_$index'),
            duration: const Duration(milliseconds: 400),
            curve: (controller.page??0).round() == index ?Curves.easeOutBack : Curves.easeOut,
            height: (controller.page??0).round() == index ? 16.0 : 8.0,
            width: (controller.page??0).round() == index ? 16.0 : 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity((controller.page??0).round() == index ? 1.0 : 0.5)
            ),
          ),
        ),),
      ),
    ) : const SizedBox();
  }
}
