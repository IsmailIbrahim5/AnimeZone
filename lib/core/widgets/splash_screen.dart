import 'package:animezone/config/styles/styles.dart';
import 'package:animezone/core/widgets/sequence_animation_builder.dart';
import 'package:animezone/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String anime = 'ANIME';
  final String zone = 'ZONE';
  final String japanese = '\nアニメゾーン';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1D1D1D),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SequenceAnimationBuilder(
            animations: anime.length + zone.length + japanese.length + 5,
            repeat: false,
            reverse: false,
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 300),
            endCallback: () {
              Future.delayed(
                const Duration(seconds: 2),
                () => Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          FadeTransition(
                              opacity: animation, child: const HomeScreen()),
                    )),
              );
            },
            builder: (values, [child]) => Stack(
              children: [
                Align(
                  alignment: Alignment(0.0 - (.8 * values[2]), 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('A',
                          style: reggaeStyle.copyWith(
                            color: Colors.white,
                            fontSize: 80.0,
                          )),
                      FractionalTranslation(
                        translation: const Offset(-.35, 0.01),
                        child: Text('Z',
                            style: reggaeStyle.copyWith(
                              color: primaryColor,
                              fontSize: 80.0,
                            )),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(.75, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FractionalTranslation(
                        translation: const Offset(0.0, 1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: List.generate(
                                anime.length,
                                (index) => ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                  child: UpwardCrossFade(
                                    value: values[index + 5],
                                    child: Text(
                                      anime[index],
                                      style: outfitStyle.copyWith(
                                          color: Colors.white,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.w400,
                                          height: .9),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: List.generate(
                                zone.length,
                                (index) => ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                  child: UpwardCrossFade(
                                    value: values[index + anime.length + 5],
                                    child: Text(zone[index],
                                        style: outfitStyle.copyWith(
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.w900,
                                            height: .9)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          japanese.length,
                          (index) => ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            child: UpwardCrossFade(
                              value: values[
                                  index + anime.length + zone.length + 5],
                              child: Text(japanese[index],
                                  style: reggaeStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 40.0,
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
