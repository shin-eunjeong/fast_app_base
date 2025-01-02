import 'package:fast_app_base/common/data/memory/todo_data_notifier.dart';
import 'package:fast_app_base/common/data/memory/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/tab/todo/d_write_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TodoDataHolderGetx extends GetxController {
  //상태관리를 Getx를 통해서 함...여러가지 부분이 심플해짐.
  final RxList<Todo> todoList = <Todo>[].obs;

// 상태값 변경 함수
  void changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final result = await ConfirmDialog('정말로 처음 상태로 변경하시겠습니까?').show();
        result?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
    }

    //내부함수로 갱신하게 됨.
    todoList.refresh();
  }

  //일정을 추가 하는 부분을 재구현.
  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      //화면이 살아있을 않을 경우 문제가 되어서 mounted까지 추가 했으나 보장된거라 MOUNTED제거
      //NOTIFIER는 내부변수로 바로 호출
      todoList.add(Todo(
        id: DateTime
            .now()
            .microsecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
      ));
    }
  }

  void editTodo(Todo todo) async {
    final result = await WriteTodoDialog(todoForEdit: todo).show();
    if (result != null) {
      todo.title = result.text;
      todo.dueDate = result.dateTime;
      todoList.refresh();
    }
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
  }
}

// context 방식에서 mixin으로 변경해야함 getx니깐.
mixin class TodoDataProvider {
  late final TodoDataHolderGetx todoData = Get.find();
}


