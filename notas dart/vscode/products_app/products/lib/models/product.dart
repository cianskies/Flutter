import 'dart:convert';

Map<String, Product> productFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

String productToJson(Map<String, Product> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
    bool aviable;
    String name;
    String? picture;
    double price;

    String? id;

    Product({
        required this.aviable,
        required this.name,
        this.picture,
        required this.price,
        this.id,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        aviable: json["aviable"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
    );

    String toJson() => json.encode(toMap());
        Map<String, dynamic> toMap() => {
        "aviable": aviable,
        "name": name,
        "picture": picture,
        "price": price,
    };

  Product copy() => Product(
    aviable: aviable,
    name: name, 
    price: price,
    id: id,
    picture: picture
    );

}
