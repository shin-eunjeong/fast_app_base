import 'package:fast_app_base/common/data/memory/todo_data_notifier.dart';
import 'package:fast_app_base/common/data/memory/todo_status.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/dialog/d_confirm.dart';
import 'package:fast_app_base/screen/main/tab/todo/d_write_todo.dart';
import 'package:flutter/cupertino.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({
  super.key,
  required super.child,
  required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    //of 였으나 context객체에서 쓸수 있도록 private 변경 _of
    //dependOnInheritedWidgetOfExactType 어디에 있어도 TodoDataHolder 반환해주는 함수임.
    TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<
        TodoDataHolder>())!;
    return inherited;
  }

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

    //notifier.notifyListeners(); 였으나 외부에서 내부함수 호출은 비추천
    notifier.notify();
  }

  //일정을 추가 하는 부분을 재구현.
  void addTodo() async {
    final result = await WriteTodoDialog().show();
    if (result != null) {
      //화면이 살아있을 않을 경우 문제가 되어서 mounted까지 추가 했으나 보장된거라 MOUNTED제거
      //NOTIFIER는 내부변수로 바로 호출
      notifier.addTodo(Todo(
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
      notifier.notify();
    }
  }

  void removeTodo(Todo todo) {
    notifier.value.remove(todo);
    notifier.notify();
  }
}


extension TodoDataHolderContextExtension on BuildContext {

  /*  * 일정에 관련내용을 모든 context객체에서 가져올 수 있도록 변경하며 해당 방법만 쓰도록 강제함. */
  TodoDataHolder get todoHolder => TodoDataHolder._of(this);
}
