import 'dart:math';

import 'package:animezone/core/providers/providers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../config/styles/styles.dart';
import '../models/app_theme.dart';
import 'background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuDrawer extends ConsumerStatefulWidget {
  const MenuDrawer({super.key});

  @override
  ConsumerState<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends ConsumerState<MenuDrawer> with SingleTickerProviderStateMixin{

  List<String> languages = [];

  final List<String> localeStrings = [
    'ar',
    'en',
    'fr',
    'es',
    'pt',
    'hi'
  ];

  late final AnimationController _mainController;

  late final Animation<double> _mainAnimation;


  @override
  void initState() {
    super.initState();


    _mainController = AnimationController(vsync: this , duration: const Duration(milliseconds: 400));
    _mainAnimation = CurvedAnimation(parent: _mainController, curve: Curves.easeOut);
    _mainController.value = ref.read(applicationThemeProvider) == AppTheme.light() ? 1.0 : 0.0;
    _mainAnimation.addListener(() {
      ref.read(applicationThemeProvider.notifier).changeTheme(AppTheme.lerp(AppTheme.light(), AppTheme.dark(), _mainAnimation.value));
    },);
  }

  @override
  Widget build(BuildContext context) {
    languages = [
      AppLocalizations.of(context)!.arabic,
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.french,
      AppLocalizations.of(context)!.spanish,
      AppLocalizations.of(context)!.potuguese,
      AppLocalizations.of(context)!.hindi,

    ];
    final screenSize = MediaQuery.sizeOf(context);
    final locale = ref.watch(localeCodeProvider).substring(0, 2);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: screenSize.width * .7,
        height: screenSize.height * .9,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(48.0))
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            const Background(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich( TextSpan(

                          children: [
                            TextSpan(text: 'ANIME', style: outfitStyle.copyWith(fontWeight: FontWeight.w400)),
                            TextSpan(text: 'ZONE', style: outfitStyle.copyWith(fontWeight: FontWeight.w900))
                          ],
                          style: outfitStyle.copyWith(
                              color: Colors.white,
                              fontSize: 18.0,
                              height: 1.0
                          )
                      )),
                      Text(
                        'アニメゾーン',
                        style: reggaeStyle.copyWith(
                            fontSize: 16.0,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Text(
                          AppLocalizations.of(context)!.created,

                        style: outfitStyle.copyWith(
                            fontSize: 6.0,
                            color: Colors.white,
                            height: 2.0
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.languages,

                        style: outfitStyle.copyWith(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: 14.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(languages.length, (index) => GestureDetector(
                          onTap: () {
                            ref.watch(localeCodeProvider.notifier).changeLocale(localeStrings[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: index == localeStrings.indexOf(locale)? Colors.white38: Colors.transparent,
                            ),
                            child: Text(
                              languages[index],
                              style: outfitStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 24.0
                              ),
                            ),
                          ),
                        ),),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                          if(_mainController.isCompleted || _mainController.value == 1.0){
                            _mainController.reverse();
                          }else{
                            _mainController.forward();
                          }
                    },
                    child: AnimatedBuilder(
                      animation: _mainController,
                      builder: (context, child) => Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: -pi  * .25,
                            alignment: const Alignment(.5, 0.0),
                            child: const Icon(
                              Icons.nightlight_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12.0,),
                          Expanded(
                            child: FittedBox(
                              child: Text(
                                (_mainController.isCompleted || _mainController.value == 1.0 ?  AppLocalizations.of(context)!.darkMode: AppLocalizations.of(context)!.lightMode).toUpperCase(),
                                style: outfitStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 24.0
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // IconButton(
                  //   key: const ValueKey('night_button'),
                  //   icon: Transform.rotate(
                  //     angle: -pi / 4,
                  //     child: const Icon(
                  //       Icons.nightlight_rounded,
                  //     ),
                  //   ),
                  //   color: theme.accentColor,
                  //   highlightColor: accentColor.withOpacity(.1),
                  //   onPressed: () {
                  //     if(_mainController.isCompleted || _mainController.value == 1.0){
                  //       _mainController.reverse();
                  //     }else{
                  //       _mainController.forward();
                  //     }
                  //   },
                  // ),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                         TextSpan(
                          text: AppLocalizations.of(context)!.tip
                        ),
                        TextSpan(
                            text: 'GOOGLE PLAY',
                          recognizer: TapGestureRecognizer()..onTap = ()=> launchUrlString('https://play.google.com/store/apps/details?id=com.glitch.animezone'),
                          style: const TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline
                          )
                        ),

                      ],
                      style: outfitStyle.copyWith(
                          fontSize: 8.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          height: 1.5
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
