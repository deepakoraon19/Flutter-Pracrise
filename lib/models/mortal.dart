class Mortal {
  String name;
  String clan;
  int level;
  String imgUrl;
  String details;

  Mortal(this.name, this.clan, this.level, this.imgUrl, this.details);
  Map<String, Object> toMap() {
    return {
      'name': name,
      'clan': clan,
      'level': level,
      'imgURl': imgUrl,
      'details': details
    };
  }

  Mortal.fromMap(Map<String, dynamic> item)
      : name = item["name"],
        clan = item["clan"],
        details = item["details"] ?? "",
        level = int.parse(item["level"]),
        imgUrl = item["imgURL"] ?? "";
}
