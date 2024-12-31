import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_status.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),// 일정 사이의 간격을 위해. padding으로 감쌈.
      child: Dismissible(
        onDismissed: (direction){
          context.todoHolder.removeTodo(todo);
        },
        background: RoundedContainer(
          backgroundColor: context.appColors.removeTodoBg,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Width(20),
              Icon(
               EvaIcons.trash2Outline,
               color: Colors.white,
              ),
            ],
          )),
        secondaryBackground: RoundedContainer(
            backgroundColor: context.appColors.removeTodoBg,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  EvaIcons.trash2Outline,
                  color: Colors.white,
                ),
                Width(20),
              ],
            )),
        key: ValueKey(todo.id),
        child: RoundedContainer(
          backgroundColor: context.appColors.itemBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                todo.dueDate.relativeDays.text.color(Colors.black).make(),
                Row(
                  children: [
                    TodoStatusWidget(todo),
                    Expanded(child: todo.title.text.size(20).color(Colors.black54).medium.make()),
                    IconButton(onPressed: () async{
                      //수정기능
                      context.todoHolder.editTodo(todo);
        
                    }, icon: Icon(EvaIcons.editOutline,color: Colors.black54,))
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
