import 'package:animezone/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/styles/styles.dart';

class NotFound extends ConsumerWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return SizedBox(
      height: screenSize.height * .4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: screenSize.height * .125,
              child: Image.asset(
                  'assets/images/not_found.png'
              )
          ),
          const SizedBox(height: 8.0,),
          Text(
            "Couldn't find anything",
            style: outfitStyle.copyWith(
                color: theme.textColor,
                fontWeight: FontWeight.w300
            ),
          ),
        ],
      ),
    );
  }
}
