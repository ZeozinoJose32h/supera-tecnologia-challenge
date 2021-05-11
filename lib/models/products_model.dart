class ProductModel {
  int id;
  String name;
  double price;
  int score;
  String image;

  ProductModel(
    this.id,
    this.name,
    this.price,
    this.score,
    this.image,
  );

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    score = json['score'];
    image = json['image'];
  }
}
