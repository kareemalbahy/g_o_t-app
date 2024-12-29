import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_o_t/business_logic/characters_cubit.dart';
import 'package:g_o_t/data/models/characters.dart';
import 'package:g_o_t/data/repo/characters_repo.dart';
import 'package:g_o_t/data/web_services/charcters_web_services.dart';
import 'package:g_o_t/presentation/screens/character_details_screen.dart';
import 'package:g_o_t/presentation/screens/characters_screen.dart';

import 'constants/strings.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character: character,));
    }
  }
}
