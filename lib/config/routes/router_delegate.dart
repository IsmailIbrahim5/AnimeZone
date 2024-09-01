// import 'package:animezone/config/routes/app_route.dart';
// import 'package:animezone/core/constants/constants.dart';
// import 'package:animezone/core/unknown/presentation/unknown_page.dart';
// import 'package:animezone/features/character/presentation/pages/character_details.dart';
// import 'package:animezone/main.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class AppRouterDelegate extends RouterDelegate<AppRoute>
//     with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
//   List<AppRoute> routes = [const AppRoute.home()];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       pages: List.generate(
//         routes.length,
//         (index) => MyPage(
//           key: ValueKey('page_$index'),
//           child: switch (routes.last.route) {
//             HomeRoute() =>  const HomeScreen(),
//             CharacterDetailsRoute() => CharacterDetails(
//               characterId: (routes.last.route as CharacterDetailsRoute).characterId , key: ValueKey('character_$index'),),
//             _ => const UnknownPage()
//           },
//         ),
//       ),
//       onPopPage: (route, result) {
//         pop();
//         return false;
//       },
//     );
//   }
//
//   void pop(){
//     routes.removeLast();
//     notifyListeners();
//   }
//
//   @override
//   Future<void> setNewRoutePath(AppRoute configuration) async {
//     if (configuration.route is HomeRoute) {
//       if (routes.length > 1) {
//         routes.removeRange(1, routes.length);
//       }
//       if (routes.first.route is! HomeRoute) routes[0] = const AppRoute.home();
//     } else if (configuration.route is UnknownRoute) {
//       if (routes.length == 1) {
//         if (routes[0].route is! UnknownRoute) routes[0] = const AppRoute.unknown();
//       } else {
//         routes.add(configuration);
//       }
//     } else {
//       if(routes.length > 2 && configuration == routes[routes.length - 2] ) {
//         routes.removeLast();
//       } else {
//         routes.add(configuration);
//       }
//     }
//     notifyListeners();
//   }
//
//   @override
//   GlobalKey<NavigatorState>? get navigatorKey => mainNavigatorKey;
//
//   @override
//   AppRoute? get currentConfiguration => routes.last;
// }
//
// class MyPage extends Page<AppRoute> {
//   final Widget child;
//
//   const MyPage({required this.child, super.key});
//
//   @override
//   Route<AppRoute> createRoute(BuildContext context) {
//     return PageRouteBuilder(
//       settings: this,
//       pageBuilder: (BuildContext context, Animation<double> animation,
//           Animation<double> secondaryAnimation) {
//         return ScaleTransition(
//           scale: animation,
//           alignment: Alignment.bottomCenter,
//           child: child,
//         );
//       },
//     );
//   }
// }
