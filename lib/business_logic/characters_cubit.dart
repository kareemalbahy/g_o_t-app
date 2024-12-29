import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/characters.dart';
import 'package:g_o_t/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<Character> getAllCharacters(){
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
