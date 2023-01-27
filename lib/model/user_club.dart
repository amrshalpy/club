class UserClub {
  String? id;
  String? name;
  String? clubName;
  

  UserClub({this.id,  this.name,this.clubName });
  UserClub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clubName = json['clubName'];
   
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'clubName': clubName,
    
    };
  }
}
