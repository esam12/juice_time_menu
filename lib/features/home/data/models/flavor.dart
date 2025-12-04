import 'package:juice_time_menu/features/home/data/models/localize_text.dart';

class Flavor {
  final String id;
  final LocalizedText name;
  final double price;
  final bool inStock;
  final String? image;

  // إذا كان الخيار له أسعار حسب الحجم (S, M, L)
  final Map<String, double>? priceBySize;

  const Flavor({
    required this.id,
    required this.name,
    required this.price,
    this.inStock = true,
    this.image,
    this.priceBySize,
  });

  factory Flavor.fromJson(Map<String, dynamic> json) {
    return Flavor(
      id: json['id'].toString(),
      name: LocalizedText.fromJson(json['name']),
      price: (json['price'] ?? 0).toDouble(),
      inStock: json['inStock'] ?? true,
      image: json['image'],
      priceBySize:
          (json['priceBySize'] as Map?)?.map((k, v) => MapEntry(k, (v as num).toDouble())),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name.toJson(),
        'price': price,
        'inStock': inStock,
        'image': image,
        'priceBySize': priceBySize,
      };
}
