import 'package:g_o_t/data/models/characters.dart';
import 'package:g_o_t/data/web_services/charcters_web_services.dart';

class CharactersRepo{
  final CharactersWebServices charactersWebServices;

  CharactersRepo(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async{
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

}