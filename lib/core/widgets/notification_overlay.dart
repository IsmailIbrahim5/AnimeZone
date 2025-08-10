import 'dart:ui';

import 'package:animezone/core/widgets/sequence_animation_builder.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../config/styles/styles.dart';
import '../providers/providers.dart';
import 'cross_fade_switcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationOverlay extends ConsumerStatefulWidget {
  final OverlayEntry overlayEntry;
  const NotificationOverlay({super.key, required this.overlayEntry});

  @override
  ConsumerState<NotificationOverlay> createState() => _NotificationOverlayState();
}

class _NotificationOverlayState extends ConsumerState<NotificationOverlay> {
  final controller = SequenceAnimationController();
  bool permissionFail = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(applicationThemeProvider);
    return SequenceAnimationBuilder(
      controller: controller,
      animations: 9,
      repeat: false,
      endCallback: (){
        if(controller.completed) {
          widget.overlayEntry.remove();
        }
      },
      builder: (values, [child]) =>  Material(
        color: primaryColor.withOpacity(values[0] * .5),

        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: values[0].clamp(0.00001, 1) * 3 , sigmaY: values[0].clamp(0.00001, 1) * 3),
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: Curves.easeOutBack.transform(values[1])*.75,
            heightFactor: values[1] *.4,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(.25),
                      blurRadius: 24.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(24.0)
              ),
              padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 24.0),
              child: CrossFadeSwitcher(
                next: permissionFail,
                child: permissionFail ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.close_rounded,
                      color: primaryColor,
                      size: Curves.easeOutBack.transform(values[4]) * 50.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale:Curves.easeOutBack.transform(values[5]),
                          child: Text(
                            AppLocalizations.of(context)!.error2,
                            style: outfitStyle.copyWith(
                                color: theme.titleTextColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 18.0
                            ),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Transform.scale(
                          scale:Curves.easeOutBack.transform(values[6]),
                          child: Text(
                            AppLocalizations.of(context)!.message3,
                            textAlign: TextAlign.center,
                            style: outfitStyle.copyWith(
                                color: theme.textColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            await openAppSettings();
                            NotificationSettings settings = await FirebaseMessaging
                                .instance.requestPermission();
                            if (settings.authorizationStatus ==
                                AuthorizationStatus.authorized) {
                              await FirebaseMessaging.instance
                                  .subscribeToTopic(
                                  'RecentNews');
                              controller.reverse?.call();
                            }
                          },
                          child: Transform.scale(
                            scale:Curves.easeOutBack.transform(values[7]),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        primaryColor,
                                        accentColor
                                      ]
                                  )
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!.openSettings,
                                style: outfitStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.reverse?.call();
                          },
                          child: Transform.scale(
                            scale:Curves.easeOutBack.transform(values[8]),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                AppLocalizations.of(context)!.askLater,
                                style: outfitStyle.copyWith(
                                    color: theme.hintTextColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(sharedPreferencesProvider).setBool('never_ask_again', true);
                            controller.reverse?.call();
                          },
                          child: Transform.scale(
                            scale:Curves.easeOutBack.transform(values[8]),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                AppLocalizations.of(context)!.neverAskAgain,
                                style: outfitStyle.copyWith(
                                    color: red,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ) : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.notifications_rounded,
                      color: primaryColor,
                      size: Curves.easeOutBack.transform(values[4]) * 50.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale:Curves.easeOutBack.transform(values[5]),
                          child: Text(
                            AppLocalizations.of(context)!.subscribeTitle,
                            style: outfitStyle.copyWith(
                                color: theme.titleTextColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 18.0
                            ),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Transform.scale(
                          scale:Curves.easeOutBack.transform(values[6]),
                          child: Text(
                            AppLocalizations.of(context)!.subscribeBody,
                            textAlign: TextAlign.center,
                            style: outfitStyle.copyWith(
                                color: theme.textColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async{
                            try {
                              NotificationSettings settings = await FirebaseMessaging
                                  .instance.requestPermission();
                              if (settings.authorizationStatus ==
                                  AuthorizationStatus.authorized) {
                                await FirebaseMessaging.instance
                                    .subscribeToTopic(
                                    'RecentNews');
                                controller.reverse?.call();
                              } else {
                                permissionFail = true;
                                widget.overlayEntry.markNeedsBuild();
                              }
                            }catch(e){
                              permissionFail = true;
                              widget.overlayEntry.markNeedsBuild();
                            }
                          },
                          child: Transform.scale(
                            scale:Curves.easeOutBack.transform(values[7]),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        primaryColor,
                                        accentColor
                                      ]
                                  )
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!.subscribeButton1,
                                style: outfitStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.reverse?.call();
                          },
                          child: Transform.scale(
                            scale:Curves.easeOutBack.transform(values[8]),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Text(
                                AppLocalizations.of(context)!.subscribeButton2,
                                style: outfitStyle.copyWith(
                                    color: theme.hintTextColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
