class EventModel {
  String? id;
  String? image;
  String? title;
  String? description;
  String? clubName;


  EventModel({this.description,this.clubName, this.id, this.image, this.title});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    clubName = json['clubName'];
    image = json['image'];
    description = json['description'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'image':image,
      'title':title,
      'clubName':clubName,
      'description':description,
    };
  }
}
