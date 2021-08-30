import 'package:simple_timecard/common/database_provider.dart';
import 'package:simple_timecard/domain/timecard.dart';
import 'package:sqflite/sqflite.dart';

class TimecardRepository {
  static String table = 'timecard';
  static DatabaseProvider instance = DatabaseProvider.instance;

  static Future<TimeCard> create(
      DateTime date, String start, String end) async {
    DateTime now = DateTime.now();
    final Map<String, dynamic> row = {
      'targetAt': date.toString(),
      'start': start,
      'end': end,
      'createdAt': now.toString(),
      'updatedAt': now.toString(),
    };

    final db = await instance.database;
    final id = await db.insert(table, row);
    return TimeCard(
      id,
      date,
      row["start"],
      row["end"],
      now,
      now,
    );
  }

  static Future<List<TimeCard>?> getAll() async {
    final Database db = await instance.database;

    final rows =
        await db.rawQuery('SELECT * FROM $table ORDER BY updatedAt DESC');
    if (rows.isEmpty) return null;
    return rows.map((json) => TimeCard.fromMap(json)).toList();
  }

  static Future<TimeCard?> getTimecard(int id) async {
    final db = await instance.database;
    final rows = await db.rawQuery('SELECT * FROM $table WHERE id = ?', [id]);
    if (rows.isEmpty) return null;
    return TimeCard.fromMap(rows.first);
  }

  static Future<int> updateTimecard(
      int id, DateTime date, String start, String end) async {
    String now = DateTime.now().toString();
    final row = {
      'id': id,
      'targetAt': date.toString(),
      'start': start,
      'end': end,
      'updatedAt': now,
    };
    final db = await instance.database;
    return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  // static Future<void> updateIsDone(List<TodoItem> list) async {
  //   final db = await instance.database;
  //   String now = DateTime.now().toString();
  //   list.forEach((todo) async {
  //     final row = {
  //       'id': todo.id,
  //       'updatedAt': now,
  //       'isDone': (todo.isDone) ? 1 : 0,
  //     };
  //     await db.update(table, row, where: 'id = ?', whereArgs: [todo.id]);
  //   });
  // }

  // static Future<void> updateIsDoneByTodoItem(TodoItem todoItem) async {
  //   String now = DateTime.now().toString();
  //   print("todoItem=${todoItem.title}");
  //   final row = {
  //     'id': todoItem.id,
  //     'updatedAt': now,
  //     'isDone': (todoItem.isDone) ? 1 : 0,
  //   };
  //   final db = await instance.database;
  //   return await db
  //       .update(table, row, where: 'id = ?', whereArgs: [todoItem.id]);
  // }

  // static Future<void> updateIsDoneById(int id, bool isDone) async {
  //   String now = DateTime.now().toString();
  //   print("id=$id,isDone=$isDone");
  //   final row = {
  //     'id': id,
  //     'updatedAt': now,
  //     'isDone': (isDone) ? 1 : 0,
  //   };
  //   final db = await instance.database;
  //
  //   return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  // }

  static Future<void> deleteTimecard(int id) async {
    final db = await instance.database;
    await db.delete(table, where: "id = ?", whereArgs: [id]);
  }
}
