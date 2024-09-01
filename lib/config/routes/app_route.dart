

import 'package:equatable/equatable.dart';

class AppRoute extends Equatable{
  final MainRoute route;

  const AppRoute.home()
      : route = const HomeRoute();

  AppRoute.animeDetails({required int animeId})
      : route = AnimeDetailsRoute(animeId: animeId );

  AppRoute.characterDetails({required int characterId})
      : route = CharacterDetailsRoute(characterId: characterId);

  const AppRoute.unknown()
      : route = const UnknownRoute();

  @override
  List<Object?> get props => [route];
}

sealed class MainRoute extends Equatable{
  final String name;
  const MainRoute(this.name);

  @override
  List<Object?> get props => [name];
}

class HomeRoute extends MainRoute{
  const HomeRoute(): super('');
}

class AnimeDetailsRoute extends MainRoute{
  final int animeId;
  const AnimeDetailsRoute({required this.animeId}): super('anime/$animeId');
  @override
  List<Object?> get props => [name , animeId];
}

class CharacterDetailsRoute extends MainRoute{
  final int characterId;
  const CharacterDetailsRoute({required this.characterId}): super('character/$characterId');
  @override
  List<Object?> get props => [name , characterId];
}

class UnknownRoute extends MainRoute{
  const UnknownRoute(): super('404');
}