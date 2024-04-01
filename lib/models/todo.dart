class ToDoItem {
  int id;
  int userId;
  String title;
  String updatedBy;
  String lastUpdatedOn;
  String desc;

  ToDoItem(this.id, this.userId, this.title, this.desc, this.lastUpdatedOn,
      this.updatedBy);

  Map<String, Object> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'updatedBy': updatedBy,
      'lastUpdatedOn': lastUpdatedOn,
      'desc': desc,
    };
  }

  ToDoItem.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        userId = item["userId"],
        title = item["title"],
        updatedBy = item["updatedBy"],
        lastUpdatedOn = item["lastUpdatedOn"],
        desc = item["desc"];
}
