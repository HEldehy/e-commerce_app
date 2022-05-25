class CardModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int ? quantity;
  bool ?isExit;
  String?time;
  CardModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExit,
    this.time
  });
  CardModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    img = json["img"];
    quantity = json["quantity"];
    isExit = json["isExit"];
    time = json["time"];
  }
}
