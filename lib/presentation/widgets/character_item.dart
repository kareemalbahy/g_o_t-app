import 'package:flutter/material.dart';
import 'package:g_o_t/constants/my_colors.dart';
import 'package:g_o_t/data/models/characters.dart';

import '../../constants/strings.dart';
import '../screens/character_details_screen.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: ()=> Navigator.of(context).pushNamed(characterDetailsScreen , arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charId,
            child: Container(
              color: MyColors.myGrey,
              child: character.image.isNotEmpty?
              FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/loading.gif",
                  image: character.image,
                  fit: BoxFit.cover,
              )
              :Image.asset("assets/image/ImageNotFound.png"),
                    ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text("${character.fullName}",
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
            ),
      )
    );
  }
}