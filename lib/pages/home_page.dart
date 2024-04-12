import 'package:flutter/material.dart';
import 'package:todo_app2/collections/task_collection.dart';
import 'package:todo_app2/isar_service.dart';
import 'package:todo_app2/util/dialog_box.dart';
import 'package:todo_app2/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _newTaskController = TextEditingController();
  final dbService = IsarService();
  final taskCollection = Task();
  Future<List<Task>>? _tasks;

  void checkBoxChanged(bool? value, int index) async {
    if (value != null) {
      final tasks = await _tasks;
      final task = tasks![index];
      task.isCompleted = value;
      await dbService.updateTask(task);
      fetchTasks();
    }
  }

  void fetchTasks() {
    setState(() {
      _tasks = dbService.getAllTasks();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _newTaskController,
          onCancel: () => Navigator.of(context).pop(),
          onSave: () async {
            dbService.createTask(
              Task()
                ..isCompleted = false
                ..task = _newTaskController.text,
            );
            _newTaskController.clear();
            Navigator.pop(context);
            fetchTasks();
            Navigator.pushReplacementNamed(context, '/');
          },
        );
      },
    );
  }

  void deleteTask(int taskId) {
    setState(() {
      dbService.deleteTask(taskId);
    });
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  void dispose() {
    _newTaskController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: const Text(
            'TO DO',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List<Task>>(
          future: _tasks,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final tasks = snapshot.data!;

              return tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'Create your first task!',
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return ToDoTile(
                          taskName: task.task,
                          taskCompleted: task.isCompleted,
                          onChanged: (value) => checkBoxChanged(value, index),
                          deleteFunction: (context) => deleteTask(task.id),
                        );
                      },
                    );
            }
          },
        ));
  }
}
