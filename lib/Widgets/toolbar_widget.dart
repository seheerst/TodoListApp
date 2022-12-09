import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/providers/all_providers.dart';
import 'package:todolist_app/providers/todo_list_manager.dart';

class ToolbarWidget extends ConsumerWidget {
  const ToolbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int onComplatedTodoCount = ref
        .watch(todoListProvider)
        .where((element) => !element.complated)
        .length;
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
            onPressed: () {},
            child: Text('All'),
          ),
        ),
        Tooltip(
          message: 'Tamamlanmamış',
          child: TextButton(
            onPressed: () {},
            child: Text('Aktif'),
          ),
        ),
        Tooltip(
          message: 'Tamamlanmış',
          child: TextButton(
            onPressed: () {},
            child: Text('Tamamlanmış'),
          ),
        )
      ],
    );
  }
}
