class Cart_Models {
  int? id;
  String? name;
  int? price;
  String? img;
  int? Quantity;
  bool? IsExists;
  String? time;

  Cart_Models(
      {this.id,
        this.name,
        this.price,
        this.img,
        this.Quantity, this.IsExists,this.time
       });

  Cart_Models.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    Quantity=json['Quantity'];
    IsExists =json["Isexists"];
    time=json['time'];

  }

  Map<String,dynamic> toJson(){
    return{
      "id":this.id,
      "name":this.name,
      "price":this.price,
      "img":this.img,
      "Quantity":this.Quantity,
      "Isexists":this.IsExists,
      "time":this.time,
    };
  }


}