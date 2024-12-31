
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:flutter/material.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>>{

  TodoDataNotifier() : super([]);

  void addTodo(Todo todo){
    value.add(todo);    //value 는 List<Todo> 임.
    notifyListeners();  //사용되는 모든 곳에 변경되었다는 것을 알려주는 함수
  }
  //notifyListeners 되도록 외부에서 하는 것보다 내부에서 하기를 추천함.
  void notify(){
    notifyListeners();
  }

}