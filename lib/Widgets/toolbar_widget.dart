import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/providers/all_providers.dart';

class ToolbarWidget extends ConsumerWidget {
  const ToolbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Row(
      children: [
        Expanded(child: Text(ref.watch(todoListProvider).length.toString() + ' Etkinliğiniz var')),
        Tooltip(
          message: 'Tüm Etkinlikler',
          child: TextButton(onPressed: (){}, child: Text('All'),),
        ),
        Tooltip(
          message: 'Tamamlanmamış',
          child: TextButton(onPressed: (){}, child: Text('Aktif'),),
        ),
        Tooltip(
          message: 'Tamamlanmış',
          child: TextButton(onPressed: (){}, child: Text('Tamamlanmış'),),
        )
      ],
    );
  }
}
