import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:thegarlanded/Models/bookName.dart';


class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  Future<Database> createDatabase() async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'favorite.db');
    _db = await openDatabase(path,version: 1,onCreate: (Database db, int v){
      //create all tables
      db.execute("create table book(id integer primary key autoincrement, title varchar(255), bookQuoted varchar(1000), aboutBook varchar(1000), bookD varchar(255))");
    });
    return _db;
  }

  Future<int> createCourse(BookName book) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('book', book.toMap());
  }

  Future<List> allCourses() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('book');
  }

  Future<int> deleteCourse(int id) async{
    Database db = await createDatabase();
    return db.delete('book',where: 'id = ?',whereArgs:[id] );
  }

}





