

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:animezone/core/widgets/animated_value.dart';
import 'package:animezone/core/widgets/background.dart';
import 'package:animezone/core/widgets/notification_overlay.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:animezone/core/widgets/sequence_animation_builder.dart';
import 'package:animezone/features/articles/presenation/pages/discussion_details.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/styles/styles.dart';
import '../../features/articles/presenation/pages/article_page.dart';
import '../../features/element/data/repository/element_repository.dart';
import '../../features/element/presentation/pages/element_search.dart';
import '../../features/element/presentation/pages/top_element.dart';
import '../../features/library/presentation/pages/library_page.dart';
import '../models/app_theme.dart';
import '../providers/providers.dart';
import '../widgets/bottom_app_bar.dart';
import '../widgets/cross_fade_switcher.dart';
import '../widgets/icon_switcher.dart';
import '../widgets/menu_drawer.dart';
import '../widgets/tab_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin{
  final pageController = PageController( keepPage: true);

  final searchController = TextEditingController();
  AppTheme? oldTheme;

  int libraryPage = 0;
  int page = 0;
  bool next = false;

  bool isSearchOn = false;
  bool isControlsOn = false;
  bool isMenuOn = false;

  double getVal(double page, int index) =>
      ((page - index).abs() * 2).clamp(0, 1);




  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });
    return completer.future;
  }

  void _check()async{
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage!= null && initialMessage.data.isNotEmpty){
      if(initialMessage.data['news_id'] != null){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DiscussionDetails(id: int.parse(initialMessage.data['news_id'] as String)),));
      }
    }
  }


  void _permission()async{
    final settings  = await FirebaseMessaging.instance.getNotificationSettings();
    if(settings.authorizationStatus != AuthorizationStatus.authorized && !(ref.read(sharedPreferencesProvider).getBool('never_ask_again')?? false)){
      _showOverlay();
    }
  }


  void _showOverlay(){
    late final OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) => NotificationOverlay(overlayEntry: overlayEntry));
    Overlay.of(context).insert(overlayEntry);
  }

  void _showContactUs(){
    final theme = ref.watch(applicationThemeProvider);
    final SequenceAnimationController controller = SequenceAnimationController();
    late final OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) => SequenceAnimationBuilder(
      controller: controller,
      animations: 6,
      repeat: false,
      endCallback: (){
        if(controller.completed) {
          overlayEntry.remove();
        }
      },
      builder: (values, [child]) =>  GestureDetector(
        onTap: () {
          controller.reverse!();
        },
        child: Material(
          color: primaryColor.withOpacity(values[0] * .5),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: values[0].clamp(0.00001, 1) * 3 , sigmaY: values[0].clamp(0.00001, 1) * 3),
            child: FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: Curves.easeOutBack.transform(values[1])*.75,
              heightFactor: values[1] *.3,
              child: Container(
                decoration: BoxDecoration(
                    color: theme.foregroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(.25),
                        blurRadius: 24.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(24.0)
                ),
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.question_mark_rounded,
                      color: primaryColor,
                      size: Curves.easeOutBack.transform(values[2]) * 50.0,
                    ),
                    Transform.scale(
                      scale:Curves.easeOutBack.transform(values[3]),
                      child: Text(
                        AppLocalizations.of(context)!.contactUs,
                        style: outfitStyle.copyWith(
                            color: theme.titleTextColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        const SizedBox(height: 12,),
                        Transform.scale(
                          scale:Curves.easeOutBack.transform(values[4]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.emailAddress,
                                textAlign: TextAlign.center,
                                style: outfitStyle.copyWith(
                                    color: theme.titleTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  final Uri _emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: 'ismaeel_ibrahem@outlook.com',
                                  );
                                  launchUrl(_emailLaunchUri);
                                },
                                child: Text(
                                  'ismaeel_ibrahem@outlook.com',
                                  textAlign: TextAlign.center,
                                  style: outfitStyle.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline,
                                    decorationColor: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Transform.scale(
                          scale:Curves.easeOutBack.transform(values[5]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.phoneNumber,
                                textAlign: TextAlign.center,
                                style: outfitStyle.copyWith(
                                    color: theme.titleTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path: '+201099238168',
                                  );
                                  launchUrl(launchUri);
                                },
                                child: Text(
                                  '+201099238168',
                                  textAlign: TextAlign.center,
                                  style: outfitStyle.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.underline,
                                      decorationColor: primaryColor
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),);
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  void initState() {
    super.initState();
    _check();
    _permission();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);

    return PopScope(
        canPop: !isSearchOn,
        onPopInvoked: (didPop) {
          if (isSearchOn) {
            setState(() {
              isSearchOn = false;
            });
          }
        },
        child:Material(
          color: theme.backgroundColor,
          child: Stack(
            children: [
              AnimatedScale(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeOut,
                scale: isMenuOn ? 1.2 : 1.0,

                child: ClipPath(
                  clipBehavior: isMenuOn ? Clip.antiAlias : Clip.none,
                  child: Container(
                    color: theme.backgroundColor,
                    child: Stack(
                      children: [
                        Positioned(
                          top: screenSize.height * (7 / 63),
                          height: screenSize.height * (56 / 63),
                          width: screenSize.width,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              PageView.builder(
                                controller:pageController,
                                itemCount: 4,
                                clipBehavior: Clip.none,
                                onPageChanged: (value) {
                                  if (page != value) {
                                    setState(() {
                                      page = value;
                                    });
                                  }
                                },
                                itemBuilder: (context, index) => FutureBuilder(
                                  future: initializeController(),
                                  builder: (context, snapshot) => snapshot.hasData
                                      ? AnimatedBuilder(
                                    animation:pageController,
                                    builder: (context, child) => Opacity(
                                      opacity: 1 -
                                          getVal(
                                              (pageController)
                                                  .hasClients
                                                  ? ((
                                                  pageController)
                                                  .page ??
                                                  0.0)
                                                  : 0.0,
                                              index),
                                      child: child,
                                    ),
                                    child: [
                                      const TopElementPage(
                                        key: ValueKey('anime_page'),
                                        elementType: ElementType.anime,
                                      ),
                                      const TopElementPage(
                                        key: ValueKey('manga_page'),
                                        elementType: ElementType.manga,
                                      ),
                                      const ArticlePage(
                                        key: ValueKey('article_page'),
                                      ),
                                      LibraryPage(
                                        key: const ValueKey('library_page'),
                                        page: libraryPage,
                                      )
                                    ][index],
                                  )
                                      : const SizedBox(),
                                ),
                              ),
                              if (isSearchOn)
                                ElementSearch(
                                  controller: searchController,
                                  controlsOn: isControlsOn,
                                  elementType:
                                  page == 0 ? ElementType.anime : ElementType.manga,
                                )
                            ],
                          ),
                        ),
                        Positioned(
                          height: screenSize.height * (7 / 63),
                          width: screenSize.width,
                          child: appBar(context),
                        ),
                        AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOut,
                            height: screenSize.height * (6 / 63),
                            bottom: isSearchOn ? -screenSize.height * (6 / 63) : 0,
                            width: screenSize.width,
                            child: BottomAppBar6(
                              controller: pageController,
                              callback: (index) async {
                                int page1 = page;
                                setState(() {
                                  next = index > page;
                                  page = index;
                                });
                                double p =
                                    (page1 + (index > page1 ? .5 : -.5)) / (4 - 1);
                                double i =
                                    (index + (index > page1 ? -.5 : .5)) / (4 - 1);

                                double max = pageController.position.maxScrollExtent;
                                await pageController.animateTo(p * max,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                                pageController.jumpTo(i * max);

                                await pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeOutQuad);
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: !isMenuOn,
                child: AnimatedValue(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    val: isMenuOn ? 1.0 : 0.0,
                    builder: (val) =>  BackdropFilter(filter: ImageFilter.blur(sigmaX: val * 2.5, sigmaY: val * 2.5), child: GestureDetector(
                        onTap: () => setState(() {
                          isMenuOn = false;
                        }),
                        child: Container(color: Colors.black.withAlpha((255 * .3 * val).toInt()),)),)),
              ),

              IgnorePointer(
                ignoring: !isMenuOn,
                child: AnimatedSlide(
                    offset: Offset(isMenuOn ? 0.0 : -1.0, 0.0),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: const MenuDrawer()),
              )

            ],
          ),
        )
    );
  }

  Widget appBar(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final theme = ref.watch(applicationThemeProvider);
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top, left: 12.0, right: 12.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: screenSize.width * .2,
            left: screenSize.width * .2,
            top: 0,
            bottom: 0,
            child: CrossFadeSwitcher(
                direction: Axis.vertical,
                next: next,
                child: switch (page) {
                  0 => Text(
                    key: const ValueKey('anime_title'),
                    AppLocalizations.of(context)!.browseAnime,
                    style: outfitStyle.copyWith(
                      color: theme.titleTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0,
                    ),
                  ),
                  1 => Text(
                    key: const ValueKey('manga_title'),
                    AppLocalizations.of(context)!.browseManga,
                    style: outfitStyle.copyWith(
                      color: theme.titleTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0,
                    ),
                  ),
                  2 => Text(
                    key: const ValueKey('articles_title'),
                    AppLocalizations.of(context)!.browseArticles,
                    style: outfitStyle.copyWith(
                      color: theme.titleTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.0,
                    ),
                  ),
                  _ => Center(
                    child: TabBar3(
                      callback: (tab) {
                        setState(() {
                          libraryPage = tab;
                        });
                      },
                      initialPage: libraryPage,
                      tabs:  [AppLocalizations.of(context)!.favorites, AppLocalizations.of(context)!.collections],
                    ),
                  ),
                }),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconSwitcher(
              icon: isSearchOn
                  ? GestureDetector(
                key: const ValueKey('settings_button'),
                onTap: () => setState(() {
                  isControlsOn = !isControlsOn;
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                      color: theme.accentColor
                          .withOpacity(isControlsOn ? .1 : .0),
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icons/settings.png',
                    color: theme.accentColor,
                    width: screenSize.width * .075,
                    height: screenSize.width * .075,
                  ),
                ),
              )
                  :
              IconButton(
                key: const ValueKey('menu_button'),
                icon: const Icon(
                  Icons.menu_rounded,
                ),
                color: theme.accentColor,
                highlightColor: accentColor.withOpacity(.1),
                onPressed: () {

                  setState(() {
                    isMenuOn = !isMenuOn;
                  });
                },
              ),

            ),
          ),
          AnimatedPositioned(
            right: page >=2  ? -screenSize.width * .3 : 0.0,
            top: 0,
            bottom: 0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSearchOn = !isSearchOn;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width:
                  isSearchOn ? screenSize.width * .8 : screenSize.width * .15,
                  height: isSearchOn
                      ? screenSize.height * .06
                      : screenSize.height * .038,
                  curve: Curves.easeOutBack,
                  decoration: BoxDecoration(
                      color:
                      isSearchOn ? theme.foregroundColor : theme.accentColor,
                      borderRadius:
                      BorderRadius.circular(isSearchOn ? 12.0 : 100),
                      boxShadow: [
                        BoxShadow(
                            color:
                            primaryColor.withOpacity(isSearchOn ? 0.0 : .24),
                            blurRadius: 8.0),
                      ]),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    child: isSearchOn
                        ? Row(
                      children: [
                        Expanded(
                          child: TextField(

                              onChanged: (value) {
                                if(isControlsOn){
                                  setState(() {
                                    isControlsOn = !isControlsOn;
                                  });
                                }
                              },
                              cursorOpacityAnimates: true,
                              controller: searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                hintText: '${AppLocalizations.of(context)!.search} ${switch(page) {0 => AppLocalizations.of(context)!.anime , 1 => AppLocalizations.of(context)!.manga, _=> ''}}...',
                                hintStyle: outfitStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: theme.hintTextColor,
                                    fontSize: 14.0),
                              ),
                              style: outfitStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: theme.textColor,
                                fontSize: 14.0,
                              )),
                        ),
                        AnimatedBuilder(
                          animation: searchController,
                          builder: (context, child) => AnimatedScale(
                            scale:
                            searchController.text.isEmpty ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeOutBack,
                            child: child,
                          ),
                          child: GestureDetector(
                            onTap: searchController.clear,
                            child: Icon(
                              Icons.close_rounded,
                              color: theme.accentColor.withOpacity(.5),
                              size: 16.0,
                            ),
                          ),
                        )
                      ],
                    )
                        : Image.asset(
                      'assets/icons/search.png',
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            right: page == 2  ? 0.0 : -screenSize.width * .5,
            top: 0,
            bottom: 0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
            child: GestureDetector(
              onTap: () {

                _showContactUs();
              },
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.contactUs,
                  style: outfitStyle.copyWith(
                      color: primaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

}