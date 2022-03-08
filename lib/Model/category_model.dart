class CategoryModel {
  String name, image, name_ar;
  int id;
  bool belong_to;


  CategoryModel({this.name, this.image, this.id, this.belong_to, this.name_ar});

  CategoryModel.fromJson(Map<dynamic, dynamic> map){
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['photo'];
    name_ar = map['name_ar'];
    id = map['id'];
    belong_to = map['belong_to'];
  }

  toJson() {
    return {
      'name': name,
      'photo': image,
      'id': id,
      'belong_to': belong_to,
    };
  }

}
