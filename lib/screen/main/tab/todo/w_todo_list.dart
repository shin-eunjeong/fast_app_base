
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      //TodoDataHolder 자체 context객체에서 불러올 수 있도록 변경했음.  valueListenable: TodoDataHolder.of(context).notifier,
        valueListenable: context.todoHolder.notifier,
        builder: (context,todoList, child){
          // Null 체크 추가
          if (todoList == null || todoList.isEmpty) {
            return '할일을 작성해보세요.'.text.size(30).color(Colors.black54).makeCentered();
          }

          return Column(
            children: todoList.map((e) => TodoItem(e)).toList(),
          );
        },
    );
  }
}
