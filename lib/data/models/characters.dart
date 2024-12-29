class Character{
  late int charId;
  late String firstName;
  late String lastName;
  late String fullName;
  late String title;
  late String familyName;
  late String image;

  Character.fromJson (Map<String,dynamic> json){
    charId= json["id"];
    firstName= json["firstName"];
    lastName= json["lastName"];
    fullName= json["fullName"];
    title= json["title"];
    familyName= json["family"];
    image= json["imageUrl"];
  }
}