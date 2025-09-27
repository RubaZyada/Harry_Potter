class CharacterModel {
  String fullName;
  String nickname;
  String hogwartsHouse;
  String interpretedBy;
  List<String> children;
  String image;
  String birthdate;
  int index;

  CharacterModel({
    required this.fullName,
    required this.nickname,
    required this.hogwartsHouse,
    required this.interpretedBy,
    required this.children,
    required this.image,
    required this.birthdate,
    required this.index,
  });

  factory CharacterModel.fromJson(Map<dynamic, dynamic> json) {
    return CharacterModel(
      fullName: json['fullName'] ?? '',
      nickname: json['nickname'] ?? '',
      hogwartsHouse: json['hogwartsHouse'] ?? '',
      interpretedBy: json['interpretedBy'] ?? '',
      children: List<String>.from(json['children'] ?? []),
      image: json['image'] ?? '',
      birthdate: json['birthdate'] ?? '',
      index: json['index'] ?? 0,
    );
  }
}
  
  
  
  
  /**{
    "fullName": "Hermione Jean Granger",
    "nickname": "Hermione",
    "hogwartsHouse": "Gryffindor",
    "interpretedBy": "Emma Watson",
    "children": [
      "Rose Granger-Weasley",
      "Hugo Granger-Weasley"
    ],
    "image": "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/characters/hermione_granger.png",
    "birthdate": "Sep 19, 1979",
    "index": 1
  }, */