import 'package:flutter/material.dart';
import 'package:g_o_t/constants/my_colors.dart';
import 'package:g_o_t/data/models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  Widget buldSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
          character.firstName,
          style: TextStyle(color: MyColors.myWhite),
          //textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 16,
          ),
        ),
      ]),
    );
  }

  Widget buildDivider(double endindent){
    return Divider(
      height: 30,
      endIndent: endindent,
      color: MyColors.myblack,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buldSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo("last name : ", character.lastName),
                      buildDivider(280),
                      characterInfo("fullname : ", character.fullName),
                      buildDivider(290),
                      characterInfo("title : ", character.title),
                      buildDivider(330),
                      characterInfo("family name : ", character.familyName),
                      buildDivider(260),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
