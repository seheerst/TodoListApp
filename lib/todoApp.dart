import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/Widgets/title_widget.dart';
import 'package:todolist_app/Widgets/todoListItem_widget.dart';
import 'package:todolist_app/Widgets/toolbar_widget.dart';
import 'package:todolist_app/models/todo_model.dart';
import 'package:todolist_app/providers/all_providers.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({Key? key}) : super(key: key);

  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(todoListProvider);

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
              onSubmitted: (newTodo) {
                ref.read(todoListProvider.notifier).addTodo(newTodo);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const ToolbarWidget(),
            for (var i = 0; i < allTodos.length; i++)
              Dismissible(
                onDismissed: (_){
                  ref.read(todoListProvider.notifier).remove(allTodos[i]);
                },
                  key: ValueKey(allTodos[i].id),
                  child: ProviderScope(
                    overrides: [currentTodoProvider.overrideWithValue(allTodos[i])],
                    child: TodoListItemWidget(

                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
