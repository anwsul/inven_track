// db operations on products table
import 'package:inven_track/models/product.dart';
import 'package:sqflite/sqlite_api.dart';

// insert a product
Future<void> insertProduct(Product product, Database db) async {
  await db.insert(
    'products',
    product.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// get all products
Future<List<Product>> getProducts(Database db) async {
  final List<Map<String, Object?>> productMaps = await db.query('products');

  return productMaps.map((productMap) {
    return Product.fromMap(productMap);
  }).toList();
}

// update a product
Future<void> updateDog(Product product, Database db) async {
  await db.update(
    'products',
    product.toMap(),
    where: 'id = ?',
    whereArgs: [product.id],
  );
}
