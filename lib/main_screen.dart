import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/styles/styles.dart';
import 'core/providers/providers.dart';
import 'core/widgets/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return  MaterialApp(
      title: 'Anime Zone',
      locale: Locale(ref.watch(localeCodeProvider)),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        primaryColor: primaryColor,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: primaryColor.withOpacity(.75),
          cursorColor: primaryColor.withOpacity(.75),
          selectionColor: primaryColor.withOpacity(.25),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // routerDelegate: AppRouterDelegate(),
      // routeInformationParser: AppRouteInformationParser(),
      // scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}
