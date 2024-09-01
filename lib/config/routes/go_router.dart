/*
import 'package:animezone/features/anime/presentation/pages/element_details.dart';
import 'package:animezone/features/anime/presentation/pages/top_element.dart';
import 'package:animezone/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/anime/domain/models/anime.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final animeDetailsKey = GlobalKey<NavigatorState>();
final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: animeDetailsKey,
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/anime/:id',
      name: 'anime_details',
      parentNavigatorKey: animeDetailsKey,
      pageBuilder: (context, state) {
        return CustomTransitionPage(

          transitionDuration: const Duration(milliseconds: 750),
          child: AnimeDetails(animeId: int.parse(state.pathParameters['id']?? '-1')), transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            alignment: Alignment.bottomCenter,
            scale: animation.drive(Tween<double>(begin:  0.0 , end: 1.0).chain(CurveTween(curve: Curves.easeOutQuad))), child: child,);
        },);
      },
    ),
  ],
);
*/
