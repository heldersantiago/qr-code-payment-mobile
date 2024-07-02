class Product {
  final int? id;
  final String? name;
  final String? description;
  final String? quantity;
  final String? price;
  final String? qrcodeUrl;

  Product({
    this.id,
    this.name,
    this.description,
    this.qrcodeUrl,
    this.price,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      qrcodeUrl: json['qrcodeUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'qrcodeUrl': qrcodeUrl,
      };
}
