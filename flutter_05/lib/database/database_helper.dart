import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';
import '../models/user.dart';

class DatabaseHelper{
  static Database? _database; // stactic + nullable
  static final DatabaseHelper instance = DatabaseHelper._(); // singleton partten

  DatabaseHelper._();

  Future<Database> get database async {
    if(_database!=null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Khởi tạo DB
  Future<Database> _initDB() async {
    String path =  join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id        INTEGER PRIMARY KEY,
        title     TEXT    NOT NULL,
        content   TEXT    NOT NULL,
        createdAt TEXT    NOT NULL
       )
       CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        fullname TEXT NOT NULL,
        dateOfBirth TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  Future<int> addUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<List<Note>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes', orderBy: 'createdAt DESC');
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  Future<List<Note>> getNotesByUserId(int userId) async {
    final db = await instance.database;

    // Truy vấn danh sách ghi chú theo `userId`
    final maps = await db.query(
      'notes',
      where: 'userId = ?', // Điều kiện lọc
      whereArgs: [userId], // Tham số truyền vào
    );

    // Chuyển đổi từ Map sang danh sách Note
    return List.generate(maps.length, (index) {
      return Note.fromMap(maps[index]);
    });
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<User?> getUserByUsernameAndPassword(String username, String password) async {
    final db = await instance.database; // Kết nối tới database
    final result = await db.query(
      'users', // Tên bảng
      where: 'username = ? AND password = ?', // Điều kiện kiểm tra
      whereArgs: [username, password], // Tham số cho điều kiện
    );

    if (result.isNotEmpty) {
      // Nếu tìm thấy, trả về đối tượng User
      return User.fromMap(result.first);
    } else {
      // Không tìm thấy user
      return null;
    }
  }

}

