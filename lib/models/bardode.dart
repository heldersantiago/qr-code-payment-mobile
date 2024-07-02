class Barcode {
  final String? name;
  final int? price;
  final String? description;
  final int? seller;

  Barcode({this.name, this.price, this.description, this.seller});

  factory Barcode.fromJson(Map<String, dynamic> json) {
    return Barcode(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      seller: json['seller'],
    );
  }
}
