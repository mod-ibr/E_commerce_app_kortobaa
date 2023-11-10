import 'package:e_commerce_app/core/constants/app_locale_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../home_view/data/models/products/result.dart';

class CartLocaleServices {
  static final CartLocaleServices instance = CartLocaleServices._init();
  CartLocaleServices._init();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table ${AppLocaleConstants.cartTableName} ( 
  ${AppLocaleConstants.id} integer primary key autoincrement, 
  ${AppLocaleConstants.productId} integer,
  ${AppLocaleConstants.productName} text,
  ${AppLocaleConstants.productImageLink} text,
  ${AppLocaleConstants.productPrice} text,
  ${AppLocaleConstants.productDescription} text,
  ${AppLocaleConstants.productRate} text,
  ${AppLocaleConstants.amount} text)
''');
  }

  Future<void> addProductToCart({required Result product}) async {
    final db = await database;
    db.insert(
        AppLocaleConstants.cartTableName, product.toJson().remove('category'));
  }

  Future<List<Result>> getAllProductsFromCart() async {
    final db = await instance.database;

    final result = await db.query(AppLocaleConstants.cartTableName);

    return result.map((json) => Result.fromJson(json)).toList();
  }

  Future<void> updateProductInCart({required Result product}) async {
    final db = await instance.database;
    db.update(
      AppLocaleConstants.cartTableName,
      product.toJson().remove('category'),
      where: '${AppLocaleConstants.productId} = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> removeProductFromCart({required int productId}) async {
    final db = await instance.database;
    await db.delete(
      AppLocaleConstants.cartTableName,
      where: '${AppLocaleConstants.productId} = ?',
      whereArgs: [productId],
    );
  }

  Future<void> cleanCart() async {
    final db = await instance.database;
    await db.delete(
      AppLocaleConstants.cartTableName,
    );
  }
}
