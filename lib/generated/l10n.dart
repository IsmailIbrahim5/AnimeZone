// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ACTION`
  String get action {
    return Intl.message('ACTION', name: 'action', desc: '', args: []);
  }

  /// `ADVENTURE`
  String get adventure {
    return Intl.message('ADVENTURE', name: 'adventure', desc: '', args: []);
  }

  /// `AIRED`
  String get aired {
    return Intl.message('AIRED', name: 'aired', desc: '', args: []);
  }

  /// `Anime`
  String get anime {
    return Intl.message('Anime', name: 'anime', desc: '', args: []);
  }

  /// `AUTHORS`
  String get authors {
    return Intl.message('AUTHORS', name: 'authors', desc: '', args: []);
  }

  /// `AVAILABLE AT`
  String get availableAt {
    return Intl.message(
      'AVAILABLE AT',
      name: 'availableAt',
      desc: '',
      args: [],
    );
  }

  /// `AVANT GARDE`
  String get avantGarde {
    return Intl.message('AVANT GARDE', name: 'avantGarde', desc: '', args: []);
  }

  /// `BACKGROUND`
  String get background {
    return Intl.message('BACKGROUND', name: 'background', desc: '', args: []);
  }

  /// `BROWSE ANIME`
  String get browseAnime {
    return Intl.message(
      'BROWSE ANIME',
      name: 'browseAnime',
      desc: '',
      args: [],
    );
  }

  /// `BROWSE ARTICLES`
  String get browseArticles {
    return Intl.message(
      'BROWSE ARTICLES',
      name: 'browseArticles',
      desc: '',
      args: [],
    );
  }

  /// `BROWSE MANGA`
  String get browseManga {
    return Intl.message(
      'BROWSE MANGA',
      name: 'browseManga',
      desc: '',
      args: [],
    );
  }

  /// `CHAPTERS`
  String get chapters {
    return Intl.message('CHAPTERS', name: 'chapters', desc: '', args: []);
  }

  /// `Characters`
  String get characters {
    return Intl.message('Characters', name: 'characters', desc: '', args: []);
  }

  /// `Collections`
  String get collections {
    return Intl.message('Collections', name: 'collections', desc: '', args: []);
  }

  /// `COMEDY`
  String get comedy {
    return Intl.message('COMEDY', name: 'comedy', desc: '', args: []);
  }

  /// `DEMO`
  String get demo {
    return Intl.message('DEMO', name: 'demo', desc: '', args: []);
  }

  /// `DRAMA`
  String get drama {
    return Intl.message('DRAMA', name: 'drama', desc: '', args: []);
  }

  /// `DUBBED IN`
  String get dubbedIn {
    return Intl.message('DUBBED IN', name: 'dubbedIn', desc: '', args: []);
  }

  /// `ENDINGS`
  String get endings {
    return Intl.message('ENDINGS', name: 'endings', desc: '', args: []);
  }

  /// `Episodes`
  String get episodes {
    return Intl.message('Episodes', name: 'episodes', desc: '', args: []);
  }

  /// `Couldn't Find Anything`
  String get error {
    return Intl.message(
      'Couldn\'t Find Anything',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `FANTASY`
  String get fantasy {
    return Intl.message('FANTASY', name: 'fantasy', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Forums`
  String get forums {
    return Intl.message('Forums', name: 'forums', desc: '', args: []);
  }

  /// `GENRES`
  String get genres {
    return Intl.message('GENRES', name: 'genres', desc: '', args: []);
  }

  /// `HORROR`
  String get horror {
    return Intl.message('HORROR', name: 'horror', desc: '', args: []);
  }

  /// `INFO`
  String get info {
    return Intl.message('INFO', name: 'info', desc: '', args: []);
  }

  /// `Library`
  String get library {
    return Intl.message('Library', name: 'library', desc: '', args: []);
  }

  /// `Light Novel`
  String get lightNovel {
    return Intl.message('Light Novel', name: 'lightNovel', desc: '', args: []);
  }

  /// `MAIN`
  String get main {
    return Intl.message('MAIN', name: 'main', desc: '', args: []);
  }

  /// `Manga`
  String get manga {
    return Intl.message('Manga', name: 'manga', desc: '', args: []);
  }

  /// `Media`
  String get media {
    return Intl.message('Media', name: 'media', desc: '', args: []);
  }

  /// `Members`
  String get members {
    return Intl.message('Members', name: 'members', desc: '', args: []);
  }

  /// `MUSIC VIDEOS`
  String get musicVideos {
    return Intl.message(
      'MUSIC VIDEOS',
      name: 'musicVideos',
      desc: '',
      args: [],
    );
  }

  /// `New Anime Forums`
  String get newAnimeForums {
    return Intl.message(
      'New Anime Forums',
      name: 'newAnimeForums',
      desc: '',
      args: [],
    );
  }

  /// `New Anime News`
  String get newAnimeNews {
    return Intl.message(
      'New Anime News',
      name: 'newAnimeNews',
      desc: '',
      args: [],
    );
  }

  /// `New Manga Forums`
  String get newMangaForums {
    return Intl.message(
      'New Manga Forums',
      name: 'newMangaForums',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message('News', name: 'news', desc: '', args: []);
  }

  /// `OPENINGS`
  String get openings {
    return Intl.message('OPENINGS', name: 'openings', desc: '', args: []);
  }

  /// `Overview`
  String get overview {
    return Intl.message('Overview', name: 'overview', desc: '', args: []);
  }

  /// `PICTURES`
  String get pictures {
    return Intl.message('PICTURES', name: 'pictures', desc: '', args: []);
  }

  /// `PROMOS`
  String get promos {
    return Intl.message('PROMOS', name: 'promos', desc: '', args: []);
  }

  /// `RATING`
  String get rating {
    return Intl.message('RATING', name: 'rating', desc: '', args: []);
  }

  /// `Recent`
  String get recent {
    return Intl.message('Recent', name: 'recent', desc: '', args: []);
  }

  /// `Recent Episodes`
  String get recentEpisodes {
    return Intl.message(
      'Recent Episodes',
      name: 'recentEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Recent Forums`
  String get recentForums {
    return Intl.message(
      'Recent Forums',
      name: 'recentForums',
      desc: '',
      args: [],
    );
  }

  /// `Recent News`
  String get recentNews {
    return Intl.message('Recent News', name: 'recentNews', desc: '', args: []);
  }

  /// `Recent Recommendations`
  String get recentRecommendations {
    return Intl.message(
      'Recent Recommendations',
      name: 'recentRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Recent Reviews`
  String get recentReviews {
    return Intl.message(
      'Recent Reviews',
      name: 'recentReviews',
      desc: '',
      args: [],
    );
  }

  /// `Recommendations`
  String get recommendations {
    return Intl.message(
      'Recommendations',
      name: 'recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Relations`
  String get relaations {
    return Intl.message('Relations', name: 'relaations', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `ROMANCE`
  String get romance {
    return Intl.message('ROMANCE', name: 'romance', desc: '', args: []);
  }

  /// `SCI-FI`
  String get sciFi {
    return Intl.message('SCI-FI', name: 'sciFi', desc: '', args: []);
  }

  /// `Score`
  String get score {
    return Intl.message('Score', name: 'score', desc: '', args: []);
  }

  /// `SEASON`
  String get season {
    return Intl.message('SEASON', name: 'season', desc: '', args: []);
  }

  /// `SLICE OF LIFE`
  String get sliceOfLife {
    return Intl.message(
      'SLICE OF LIFE',
      name: 'sliceOfLife',
      desc: '',
      args: [],
    );
  }

  /// `SOURCE`
  String get source {
    return Intl.message('SOURCE', name: 'source', desc: '', args: []);
  }

  /// `SPORTS`
  String get sports {
    return Intl.message('SPORTS', name: 'sports', desc: '', args: []);
  }

  /// `STATUS`
  String get status {
    return Intl.message('STATUS', name: 'status', desc: '', args: []);
  }

  /// `STUDIOS`
  String get studios {
    return Intl.message('STUDIOS', name: 'studios', desc: '', args: []);
  }

  /// `SUPER NATURAL`
  String get superNatural {
    return Intl.message(
      'SUPER NATURAL',
      name: 'superNatural',
      desc: '',
      args: [],
    );
  }

  /// `SUPPORTING`
  String get supporting {
    return Intl.message('SUPPORTING', name: 'supporting', desc: '', args: []);
  }

  /// `SYNOPSIS`
  String get synopsis {
    return Intl.message('SYNOPSIS', name: 'synopsis', desc: '', args: []);
  }

  /// `THEMES`
  String get themes {
    return Intl.message('THEMES', name: 'themes', desc: '', args: []);
  }

  /// `This Season`
  String get thisSeason {
    return Intl.message('This Season', name: 'thisSeason', desc: '', args: []);
  }

  /// `TYPE`
  String get type {
    return Intl.message('TYPE', name: 'type', desc: '', args: []);
  }

  /// `VOLUMES`
  String get volumes {
    return Intl.message('VOLUMES', name: 'volumes', desc: '', args: []);
  }

  /// `VOTES`
  String get votes {
    return Intl.message('VOTES', name: 'votes', desc: '', args: []);
  }

  /// `Watch Trailer`
  String get watchTrailer {
    return Intl.message(
      'Watch Trailer',
      name: 'watchTrailer',
      desc: '',
      args: [],
    );
  }

  /// `Add To Collection`
  String get addToCollection {
    return Intl.message(
      'Add To Collection',
      name: 'addToCollection',
      desc: '',
      args: [],
    );
  }

  /// `Airing`
  String get airing {
    return Intl.message('Airing', name: 'airing', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Boys Love`
  String get boysLove {
    return Intl.message('Boys Love', name: 'boysLove', desc: '', args: []);
  }

  /// `Complete`
  String get complete {
    return Intl.message('Complete', name: 'complete', desc: '', args: []);
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `CREATED BY THE ONE AND ONLY, GLITCH.\nCHECK MY SOCIALS FOR MORE INFO`
  String get created {
    return Intl.message(
      'CREATED BY THE ONE AND ONLY, GLITCH.\nCHECK MY SOCIALS FOR MORE INFO',
      name: 'created',
      desc: '',
      args: [],
    );
  }

  /// `Create New Collection`
  String get createNewCollection {
    return Intl.message(
      'Create New Collection',
      name: 'createNewCollection',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'current' key

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Enter Collection Title`
  String get enterCollectionTitle {
    return Intl.message(
      'Enter Collection Title',
      name: 'enterCollectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Girls Love`
  String get girlsLove {
    return Intl.message('Girls Love', name: 'girlsLove', desc: '', args: []);
  }

  /// `Gourmet`
  String get gourmet {
    return Intl.message('Gourmet', name: 'gourmet', desc: '', args: []);
  }

  /// `If you liked`
  String get ifYouLiked {
    return Intl.message('If you liked', name: 'ifYouLiked', desc: '', args: []);
  }

  /// `LANGUAGES`
  String get languages {
    return Intl.message('LANGUAGES', name: 'languages', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Don't know what you are looking for?`
  String get message1 {
    return Intl.message(
      'Don\'t know what you are looking for?',
      name: 'message1',
      desc: '',
      args: [],
    );
  }

  /// `Mixed Feelings`
  String get mixedFeelings {
    return Intl.message(
      'Mixed Feelings',
      name: 'mixedFeelings',
      desc: '',
      args: [],
    );
  }

  /// `Mystery`
  String get mystery {
    return Intl.message('Mystery', name: 'mystery', desc: '', args: []);
  }

  /// `Not Recommended`
  String get notRecommended {
    return Intl.message(
      'Not Recommended',
      name: 'notRecommended',
      desc: '',
      args: [],
    );
  }

  /// `Ordering`
  String get ordering {
    return Intl.message('Ordering', name: 'ordering', desc: '', args: []);
  }

  /// `Popularity`
  String get popularity {
    return Intl.message('Popularity', name: 'popularity', desc: '', args: []);
  }

  /// `Portuguese`
  String get potuguese {
    return Intl.message('Portuguese', name: 'potuguese', desc: '', args: []);
  }

  /// `Random Anime`
  String get randomAnime {
    return Intl.message(
      'Random Anime',
      name: 'randomAnime',
      desc: '',
      args: [],
    );
  }

  /// `Rank`
  String get rank {
    return Intl.message('Rank', name: 'rank', desc: '', args: []);
  }

  /// `Read More`
  String get readMore {
    return Intl.message('Read More', name: 'readMore', desc: '', args: []);
  }

  /// `Recommended`
  String get recommended {
    return Intl.message('Recommended', name: 'recommended', desc: '', args: []);
  }

  /// `Recommend Me`
  String get recommendMe {
    return Intl.message(
      'Recommend Me',
      name: 'recommendMe',
      desc: '',
      args: [],
    );
  }

  /// `Search for`
  String get search {
    return Intl.message('Search for', name: 'search', desc: '', args: []);
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message('Sort By', name: 'sortBy', desc: '', args: []);
  }

  /// `Spanish`
  String get spanish {
    return Intl.message('Spanish', name: 'spanish', desc: '', args: []);
  }

  /// `Suspense`
  String get suspense {
    return Intl.message('Suspense', name: 'suspense', desc: '', args: []);
  }

  /// `Then you might like`
  String get thenYouMightLike {
    return Intl.message(
      'Then you might like',
      name: 'thenYouMightLike',
      desc: '',
      args: [],
    );
  }

  /// `HAVE A SUGGESTION OR SOMETHING ISN'T WORKING? LEAVE A REVIEW ON`
  String get tip {
    return Intl.message(
      'HAVE A SUGGESTION OR SOMETHING ISN\'T WORKING? LEAVE A REVIEW ON',
      name: 'tip',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message('Upcoming', name: 'upcoming', desc: '', args: []);
  }

  /// `Watch On`
  String get watchOn {
    return Intl.message('Watch On', name: 'watchOn', desc: '', args: []);
  }

  /// `Favorite Anime`
  String get favoriteAnime {
    return Intl.message(
      'Favorite Anime',
      name: 'favoriteAnime',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Manga`
  String get favoriteManga {
    return Intl.message(
      'Favorite Manga',
      name: 'favoriteManga',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `This episode is available on`
  String get tip2 {
    return Intl.message(
      'This episode is available on',
      name: 'tip2',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `French`
  String get french {
    return Intl.message('French', name: 'french', desc: '', args: []);
  }

  /// `Disclaimer`
  String get disclaimer {
    return Intl.message('Disclaimer', name: 'disclaimer', desc: '', args: []);
  }

  /// `This app is not for streaming or reading anime/manga content.\n\nAnime Zone is an informational app that provides anime and manga details, statistics, and community reviews using public APIs like Jikan (MyAnimeList).\nWe do not host, stream, or provide access to any copyrighted anime episodes or manga chapters.\n\nHowever, where available, we include links to official streaming platforms such as Crunchyroll, Netflix, Funimation, and others — so users can easily find where to watch legally.\n\nWe encourage everyone to support the creators by watching on official services.`
  String get disclaimerText {
    return Intl.message(
      'This app is not for streaming or reading anime/manga content.\n\nAnime Zone is an informational app that provides anime and manga details, statistics, and community reviews using public APIs like Jikan (MyAnimeList).\nWe do not host, stream, or provide access to any copyrighted anime episodes or manga chapters.\n\nHowever, where available, we include links to official streaming platforms such as Crunchyroll, Netflix, Funimation, and others — so users can easily find where to watch legally.\n\nWe encourage everyone to support the creators by watching on official services.',
      name: 'disclaimerText',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message('Continue', name: 'continueText', desc: '', args: []);
  }

  /// `New`
  String get neww {
    return Intl.message('New', name: 'neww', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Hindi`
  String get hindi {
    return Intl.message('Hindi', name: 'hindi', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Relations`
  String get relations {
    return Intl.message('Relations', name: 'relations', desc: '', args: []);
  }

  /// `Permission Failed!`
  String get error2 {
    return Intl.message(
      'Permission Failed!',
      name: 'error2',
      desc: '',
      args: [],
    );
  }

  /// `You rejected the notification permission, open settings to enable it`
  String get message3 {
    return Intl.message(
      'You rejected the notification permission, open settings to enable it',
      name: 'message3',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get openSettings {
    return Intl.message(
      'Open Settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Ask Later`
  String get askLater {
    return Intl.message('Ask Later', name: 'askLater', desc: '', args: []);
  }

  /// `Never Ask Again`
  String get neverAskAgain {
    return Intl.message(
      'Never Ask Again',
      name: 'neverAskAgain',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe to recent news`
  String get subscribeTitle {
    return Intl.message(
      'Subscribe to recent news',
      name: 'subscribeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to receive notifications about the latest anime & manga news and stay updated?`
  String get subscribeBody {
    return Intl.message(
      'Would you like to receive notifications about the latest anime & manga news and stay updated?',
      name: 'subscribeBody',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I would like to stay updated`
  String get subscribeButton1 {
    return Intl.message(
      'Yes, I would like to stay updated',
      name: 'subscribeButton1',
      desc: '',
      args: [],
    );
  }

  /// `No, I don't want that`
  String get subscribeButton2 {
    return Intl.message(
      'No, I don\'t want that',
      name: 'subscribeButton2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
