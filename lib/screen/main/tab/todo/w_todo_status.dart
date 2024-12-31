import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/memory/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_fire.dart';
import 'package:flutter/material.dart';

class TodoStatusWidget extends StatelessWidget {
  //enum 클래스가 있어서 widget더 붙였음.

  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: (){
        context.todoHolder.changeTodoStatus(todo);
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: switch(todo.status){
          TodoStatus.complete => Checkbox(
            value: true,
            onChanged: null,
            fillColor: WidgetStateProperty.all(context.appColors.checkBoxColor),
          ),
          TodoStatus.incomplete => Checkbox(
            value: false,
            onChanged: null,
          ),
          TodoStatus.ongoing => const Fire()
        }),
    );
  }
}
