import 'package:flutter/material.dart';
import 'package:todolist_app/Widgets/title_widget.dart';
import 'package:todolist_app/Widgets/todoListItem_widget.dart';
import 'package:todolist_app/Widgets/toolbar_widget.dart';
import 'package:todolist_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {

  TodoApp({Key? key}) : super(key: key);

  final newTodoController = TextEditingController();

  List<TodoModel> allTodos = [
    TodoModel(id: Uuid().v4(), description: 'Spora Git'),
    TodoModel(id: Uuid().v4(), description: 'Alışveriş yap'),
    TodoModel(id: Uuid().v4(), description: 'Anneni ara'),
  ];

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
            const SizedBox(height: 20,),
            const ToolbarWidget(),
            for(var i =0; i< allTodos.length;i++)
              Dismissible(key:ValueKey(allTodos[i].id),child: TodoListItemWidget(item: allTodos[i],))
          ],
        ),
      ),
    );
  }
}
