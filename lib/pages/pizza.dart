class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Konstruktor default untuk membuat objek Pizza kosong
  Pizza.empty()
      : id = 0,
        pizzaName = '',
        description = '',
        price = 0.0,
        imageUrl = '';

  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        pizzaName = json['pizzaName'],
        description = json['description'],
        price = (json['price'] as num).toDouble(),
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
