class UserModel{
  String UserID, email, name, pic;
  UserModel({this.UserID, this.name, this.email, this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map){
    if(map==null){
      return;
    }
    UserID = map['UserID'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }
  toJson(){
    return {
      'userID' : UserID,
      'email' : email,
      'name' : name,
      'pic' : pic

    };
  }
}