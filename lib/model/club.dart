class ClubModel {
  String? id;
  String? image;
  String? title;
  String? description;

  ClubModel({this.description, this.id, this.image, this.title});

  ClubModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'image':image,
      'title':title,
      'description':description,
    };
  }
}
