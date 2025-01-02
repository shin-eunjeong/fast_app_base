import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/memory/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_fire.dart';
import 'package:flutter/material.dart';

class TodoStatusWidget extends StatelessWidget with TodoDataProvider{
  //getx로 context로 받던걸 tododata로 변경함.
  //enum 클래스가 있어서 widget더 붙였음.

  final Todo todo;

  TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: (){
        todoData.changeTodoStatus(todo);
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
