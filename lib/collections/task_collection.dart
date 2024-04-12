import 'package:isar/isar.dart';

part 'task_collection.g.dart';

@Collection()
class Task {
  Id id = Isar.autoIncrement;

  late String task;

  late bool isCompleted;
}