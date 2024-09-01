import 'package:animezone/core/providers/providers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/styles/styles.dart';

class Error1 extends ConsumerWidget {
  const Error1({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final theme = ref.watch(applicationThemeProvider);
    final screenSize = MediaQuery.sizeOf(context);
    return Transform.scale(
      scale: .5,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: screenSize.height * .7,
          maxWidth: screenSize.width,
          minHeight: 0,
          minWidth: 0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
                child: Image.asset(
                    'assets/images/fail.png'
                )
            ),
            const SizedBox(height: 8.0,),
            Expanded(
              child: AutoSizeText(
                "There was an error!",
                maxFontSize: 50.0,
                maxLines: 1,
                style: outfitStyle.copyWith(
                    color: theme.textColor,
                    fontWeight: FontWeight.w300,
                  fontSize: 50
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
