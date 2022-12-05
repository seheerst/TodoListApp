import 'package:flutter/material.dart';
import 'package:todolist_app/Widgets/title_widget.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  final newTodoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: ListView(
          children: [
            const TitleWidget(),
            TextField(
              controller: newTodoController,
              decoration:
                  const InputDecoration(labelText: 'Neler Yapacaksın Bugün ?'),
              onSubmitted: (newTodo) {},
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
