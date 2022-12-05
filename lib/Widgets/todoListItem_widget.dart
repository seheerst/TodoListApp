import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoListItemWidget extends StatelessWidget {
  TodoModel item;
   TodoListItemWidget({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: true,
        onChanged: (value){},
      ),
      title: Text(item.description),
    );
  }
}