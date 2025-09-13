import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../features/home/data/models/models_top_headline/Artical_Top_Headline.dart';

class ArticleDBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "articles.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE articles(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            author TEXT,
            urlToImage TEXT,
            publishedAt TEXT,
            content TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertArticle(ArticlesTopheadline article) async {
    final db = await database;
    return await db.insert(
      'articles',
      {
        'title': article.title,
        'author': article.author,
        'urlToImage': article.urlToImage,
        'publishedAt': article.publishedAt,
        'content': article.content,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getArticles() async {
    final db = await database;
    return await db.query("articles");
  }
  static Future<int> deleteArticle(String title) async {
    final db = await database;
    return await db.delete(
      'articles',
      where: 'title = ?',
      whereArgs: [title],
    );
  }

}
