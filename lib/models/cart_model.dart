class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist; // is exists in cart
  String? time;

  CartModel(
      {this.id,
        this.name,
        this.price,
        this.quantity,
        this.isExist,
        this.time,
        this.img,});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }
}
