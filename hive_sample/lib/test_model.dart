import 'package:hive/hive.dart';

part 'test_model.g.dart';

@HiveType(typeId: 0)
class TestModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;

  TestModel({required this.id, required this.name});
}
