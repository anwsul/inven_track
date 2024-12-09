import 'package:inven_track/models/unit.dart';

class Product {
  final int id;
  final String name;
  final Unit unit;
  final double buyingPricePerUnit;
  final double sellingPricePerUnit;
  final String? imageOfProduct;

  Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.buyingPricePerUnit,
    required this.sellingPricePerUnit,
    this.imageOfProduct,
  });

  factory Product.fromMap(Map<String, Object?> productMap) {
    return Product(
      id: productMap['id'] as int,
      name: productMap['name'] as String,
      unit: Unit.values[productMap['unit_id'] as int],
      buyingPricePerUnit: productMap['buyingPricePerUnit'] as double,
      sellingPricePerUnit: productMap['sellingPricePerUnit'] as double,
      imageOfProduct: productMap['imageOfProduct'] as String?,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'unit_id': unit.index,
      'buyingPricePerUnit': buyingPricePerUnit,
      'sellingPricePerUnit': sellingPricePerUnit,
      'imageOfProduct': imageOfProduct,
    };
  }

  @override
  String toString() {
    return '''Product{
                  id: $id, 
                  name: $name, 
                  unit: $unit, 
                  buyingPricePerUnit: $buyingPricePerUnit, 
                  sellingPricePerUnit: $sellingPricePerUnit
              }''';
  }
}
