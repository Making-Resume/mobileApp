class Category{

    final String? id;
    final String? title;
    final String? image;

  
  Category({this.id , this.title ,this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
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