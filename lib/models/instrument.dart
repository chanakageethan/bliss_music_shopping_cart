class Instrument {
  String id;
  String name;
  String category;
  String brand;
  String model;
  double price;
  String colour;
  String weight;
  String image;
  late bool isFavorite;

  Instrument(
      {required this.id,
      required this.name,
      required this.category,
      required this.brand,
      required this.model,
      required this.price,
      required this.colour,
      required this.weight,
      required this.image,
      this.isFavorite = false,
      });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      brand: json["brand"],
      model: json["model"],
      price: json["price"],
      colour: json["colour"],
      weight: json["weight"],
      image: json["image"],
    );
  }



}
