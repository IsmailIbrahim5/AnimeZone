import 'package:animezone/config/routes/app_route.dart';
import 'package:flutter/cupertino.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoute>{


  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      return const AppRoute.home();
    }

    if (uri.pathSegments.length > 3) {
      return const AppRoute.unknown();
    }

    if (uri.pathSegments.length == 1) {
      return switch(uri.pathSegments.first){
        '' => const AppRoute.home(),
        _ => const AppRoute.unknown()
      };
    }
    if(uri.pathSegments.length == 2){
      return switch(uri.pathSegments.first){
        'anime' => AppRoute.animeDetails(animeId: int.tryParse(uri.pathSegments[1])?? -1),
        'character' => AppRoute.characterDetails(characterId: int.tryParse(uri.pathSegments[1])?? -1),
        _ => const AppRoute.unknown()
      };
    }

    return Future.value(const AppRoute.unknown());
  }

  @override
  RouteInformation restoreRouteInformation(AppRoute configuration) => _getRouteInformation(configuration.route.name);

  RouteInformation _getRouteInformation(String page) => RouteInformation(uri: Uri.parse('/$page'));
}