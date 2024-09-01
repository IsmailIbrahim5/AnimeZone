import 'dart:io';

import 'package:animezone/core/providers/providers.dart';
import 'package:animezone/features/character/data/datasources/character_api.dart';
import 'package:animezone/features/character/domain/models/character.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/models/images.dart';

class CharacterRepository{

  final ProviderRef<CharacterRepository> ref;
  final List<Character> cachedCharacters = [];

  CharacterRepository({required this.ref});

  Future<List<Character>> getAnimeSearch({String? q,
    int? page,
    int? limit,
    String? orderBy,
    bool asc = true,
    String? letter}) async{
    if(q == null && letter == null) throw Error();

    final dioClient = ref.read(dioProvider);
    final uri = CharacterAPI.getCharacterSearch(q: q , page: page , limit: limit,orderBy: orderBy , asc: asc , letter: letter);
    final response = await dioClient.getUri(uri);
    if(response.statusCode == HttpStatus.ok){
      final charactersData = (response.data as Map<String ,dynamic>)['data'] as List<dynamic>;
      // List<Character> characters =  charactersData.map((e) => Character.fromJson(e as Map<String , dynamic>)).toList();
      List<Character> characters =  [];
      for(var e in charactersData){
        Map<String,dynamic> map = e as Map<String, dynamic>;
        // map = await addExtraImages(map);
        Character character = Character.fromJson(map);

        if(!cachedCharacters.contains(character)) cachedCharacters.add(character);
        characters.add(character);
      }
      return characters;
    }else{
      throw HttpException(response.statusMessage??'');
    }
  }

  Future<Character> getCharacterFull(int id) async{
    final dioClient = ref.read(dioProvider);
    Character? character = cachedCharacters.where((element) => element.malId == id).firstOrNull;
    if(character != null) return character;
    final uri = CharacterAPI.getCharacterFull(id);
    final response = await dioClient.getUri(uri);
    if(response.statusCode == HttpStatus.ok){
      var characterData = (response.data as Map<String ,dynamic>)['data'] as Map<String, dynamic>;
      // characterData = await addExtraImages(characterData);
      Character character = Character.fromJson(characterData);
      if(!cachedCharacters.contains(character)) cachedCharacters.add(character);
      return character;
    }else{
      throw HttpException(response.statusMessage??'');
    }
  }

  Future<List<Character>> getTopCharacters({
    int? page,
    int? limit,
  }) async{
    final dioClient = ref.read(dioProvider);
    final uri = CharacterAPI.getCharacterTop(limit: limit, page: page);
    final response = await dioClient.getUri(uri);
    if(response.statusCode == HttpStatus.ok){
      final charactersData = (response.data as Map<String ,dynamic>)['data'] as List<dynamic>;
      List<Character> characters =  [];
      for(var e in charactersData){
        Map<String,dynamic> map = e as Map<String, dynamic>;
        // map = await addExtraImages(map);
        Character character = Character.fromJson(map);

        if(!cachedCharacters.contains(character)) cachedCharacters.add(character);
        characters.add(character);
      }
      return characters;
    }else{
      throw HttpException(response.statusMessage??'');
    }
  }


  Future<Map<String, dynamic>> addExtraImages(Map<String , dynamic> map)async {
    final extraImages = await ref.read(imagesProvider).getExtraImages(uri: Uri.https(JIKANAPIBaseUrl ,'/v4/characters/${map['mal_id']}/pictures'));
    map['images'] = {map['images'] as Map<String,dynamic>,...List.generate(
        extraImages.length, (index) => { 'jpg' : extraImages[index].toJson()})};
    return map;
  }

  Future<List<Image>> getCharacterPictures(int id) async{
    return await ref.read(imagesProvider).getExtraImages(uri: CharacterAPI.getCharacterPictures(id));
  }

  Future<List<Map<String,dynamic>>> getCharacterAnime(int id) async{
    final dioClient = ref.read(dioProvider);
    final response = await dioClient.getUri(CharacterAPI.getCharacterAnime(id));
    final data = response.data ['data'] as List<dynamic>;
    return data.map((e) => e as Map<String,dynamic>).toList();
  }
}

