import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/providers/all_providers.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
  TodoModel item;
  TodoListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  _TodoListItemWidgetState createState() => _TodoListItemWidgetState();
}

class _TodoListItemWidgetState extends ConsumerState<TodoListItemWidget> {
  late FocusNode _textFocusNode;
  late TextEditingController _textController;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textFocusNode = FocusNode();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textFocusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (isFocused) {
        if (!isFocused) {
          setState(() {
            _hasFocus = false;
          });
          ref
              .read(todoListProvider.notifier)
              .edit(id: Uuid().v4(), newDescription: _textController.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
          });
          _textFocusNode.requestFocus();
          _textController.text = widget.item.description;
        },
        leading: Checkbox(
          value: widget.item.complated,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggle(widget.item.id);
          },
        ),
        title: _hasFocus
            ? TextField(
                focusNode: _textFocusNode,
                controller: _textController,
              )
            : Text(widget.item.description),
      ),
    );
  }
}
