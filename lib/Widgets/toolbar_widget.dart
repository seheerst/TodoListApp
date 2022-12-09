import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/providers/all_providers.dart';
import 'package:todolist_app/providers/todo_list_manager.dart';

class ToolbarWidget extends ConsumerWidget {
  ToolbarWidget({Key? key}) : super(key: key);
  var _currentfilter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filt) {
    return _currentfilter == filt ? Colors.green : Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onComplatedTodoCount = ref.watch(unComplatedTodoCount);
    _currentfilter = ref.watch(todoListFilter);
    return Row(
      children: [
        Expanded(
            child: Text(
          onComplatedTodoCount == 0
              ? 'tüm görevler tamamlandı'
              : onComplatedTodoCount.toString() + ' Etkinliğiniz var',
          overflow: TextOverflow.ellipsis,
        )),
        Tooltip(
          message: 'Tüm Etkinlikler',
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.all)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.all;
            },
            child: Text('Tümü'),
          ),
        ),
        Tooltip(
          message: 'Tamamlanmamış',
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.active)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodoListFilter.active;
            },
            child: Text(
              'Aktif',
            ),
          ),
        ),
        Tooltip(
          message: 'Tamamlanmış',
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodoListFilter.complated)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state =
                  TodoListFilter.complated;
            },
            child: Text('Tamamlanmış'),
          ),
        )
      ],
    );
  }
}
