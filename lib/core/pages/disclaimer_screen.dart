import 'package:animezone/config/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_screen.dart';

class DisclaimerScreen extends ConsumerWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return Material(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenSize.width * .05),
        child: Column(
          children: [
            Spacer(),
            Icon(
              Icons.error_outline_rounded,
              size: screenSize.width * .25,
              color: primaryColor,
            ),
            SizedBox(height: screenSize.height * .025,),
            Text(
              AppLocalizations.of(context)!.disclaimer,
              style: outfitStyle.copyWith(
                  color: theme.titleTextColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.0
              ),
            ),
            SizedBox(height: 16,),

            Text(
              AppLocalizations.of(context)!.disclaimerText,
              style: outfitStyle.copyWith(
                  color: theme.titleTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0
              ),
            ),
            SizedBox(height: screenSize.height * .1,),

            SizedBox(
              width: screenSize.width * .4,
              height: screenSize.height * .065,
              child: MaterialButton(
                color: primaryColor,
                highlightColor: theme.bgColor.withAlpha(25),
                splashColor: theme.bgColor.withAlpha(55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {
                  ref.read(sharedPreferencesProvider).setBool('initialized', true);
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                                opacity: animation, child: const HomeScreen()),
                      ));
                },
                child: Text(
                  AppLocalizations.of(context)!.continueText,
                  style: outfitStyle.copyWith(
                      color: theme.bgColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0
                  ),
                ),
              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}
