import 'package:hello/models/mortal.dart';

class Mapper {
  static Map<String, Object> toMap(Mortal obj) {
    return {
      'name': obj.name,
      'clan': obj.clan,
      'level': obj.level,
      'imgURl': obj.imgUrl,
      'details': obj.details
    };
  }

  static Mortal fromMap(Map<String, dynamic> item) => Mortal(item["name"],
      item["clan"], item["details"], item["level"], item["imgURL"]);
}
