class Mortal {
  String name;
  String clan;
  int level;
  String imgUrl;

  Mortal(this.name, this.clan, this.level, this.imgUrl);
  Map<String, Object> toMap() {
    return {'name': name, 'clan': clan, 'level': level, 'imgURl': imgUrl};
  }

  Mortal.fromMap(Map<String, dynamic> item)
      : name = item["name"],
        clan = item["clan"],
        level = int.parse(item["level"]),
        imgUrl = item["imgURL"] ?? "";
}
