import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app2/collections/task_collection.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> createTask(Task newTask) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tasks.put(newTask);
    });
  }

  Future<void> deleteTask(int deletedTaskId) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.tasks.delete(deletedTaskId);
    });
  }

  Future<void> updateTask(Task task) async {
    final isar = await db;
    await isar.writeTxn(
      () async {
        final updatedTask = await isar.tasks.get(task.id);

        if (updatedTask != null) {
          await isar.tasks.put(task);
        }
      },
    );
  }

  Future<List<Task>> getAllTasks() async {
    final isar = await db;
    return await isar.tasks.where().findAll();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [TaskSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
