import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../core/constants/app_locale_constants.dart';
import 'models/favorite/favorite.dart';

class FavoriteLocaleServices {
  static final FavoriteLocaleServices instance = FavoriteLocaleServices._init();
  FavoriteLocaleServices._init();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('favorite.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table ${AppLocaleConstants.favoriteTableName} ( 
  ${AppLocaleConstants.id} integer primary key autoincrement, 
  ${AppLocaleConstants.productId} integer not null,
  ${AppLocaleConstants.productName} text not null,
  ${AppLocaleConstants.productImageLink} text not null,
  ${AppLocaleConstants.productPrice} text not null,
  ${AppLocaleConstants.productDescription} text not null,
  ${AppLocaleConstants.productRate} text not null,
  ${AppLocaleConstants.productCategoryId} integer not null,
  ${AppLocaleConstants.productCategoryName} text not null,
  ${AppLocaleConstants.productCategoryImageLink} text not null,)
''');
  }

  Future<void> addProductToFavorite({required Favorite favorite}) async {
    final db = await database;
    db.insert(AppLocaleConstants.favoriteTableName, favorite.toJson());
  }

  Future<List<Favorite>> getAllFavorites() async {
    final db = await instance.database;

    final result = await db.query(AppLocaleConstants.favoriteTableName);

    return result.map((json) => Favorite.fromJson(json)).toList();
  }

  Future<void> updateProductInFavorites({required Favorite favorite}) async {
    final db = await instance.database;
    db.update(
      AppLocaleConstants.favoriteTableName,
      favorite.toJson(),
      where: '${AppLocaleConstants.productId} = ?',
      whereArgs: [favorite.id],
    );
  }

  Future<void> removeProductFromFavorite({required int productId}) async {
    final db = await instance.database;
    await db.delete(
      AppLocaleConstants.favoriteTableName,
      where: '${AppLocaleConstants.productId} = ?',
      whereArgs: [productId],
    );
  }

  Future<void> cleanAllFavorite() async {
    final db = await instance.database;
    await db.delete(
      AppLocaleConstants.favoriteTableName,
    );
  }
}