import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist_app/providers/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

final todoListProvider = StateNotifierProvider<TodoListManager,List<TodoModel>>((ref){
  return TodoListManager([
    TodoModel(id: Uuid().v4(), description: 'Spora git'),
    TodoModel(id: Uuid().v4(), description: 'Alışveriş yap'),
    TodoModel(id: Uuid().v4(), description: 'Ders çalış'),
  ]);
});