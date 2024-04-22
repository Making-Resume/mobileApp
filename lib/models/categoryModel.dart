class Category_Model{

    final String? id;
    final String? title;
    final String? image;

  
  Category_Model({this.id , this.title ,this.image});

  factory Category_Model.fromJson(Map<String, dynamic> json) {
    return Category_Model(
      id: json['id'] as String,
      title: json['title'] as String,
      image :json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image' : image,

    };
  }

}


class Category_Item {
  final List<Category_Model> items;
  final int code;
  final String? message;
  final String? errors;
 

  Category_Item({
    required this.items,
    required this.code,
    this.message,
    this.errors,

  });

  factory Category_Item.fromJson(Map<String, dynamic> json) {
    List<Category_Model> items = [];
    if (json['items'] != null) {
      items = List<Category_Model>.from(
        json['items'].map((item) => Category_Model.fromJson(item)),
      );
    }

    return Category_Item(
      items: items,
      code: json['code'],
      message: json['message'],
      errors: json['errors'],
      
    );
  }
}