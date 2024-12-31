/* app 자체에서 데이터 저장을 하는 방식.....상태관리 관련 내용을 확인 할 수 있다.*/
import 'package:fast_app_base/common/data/memory/todo_status.dart';

class Todo{
  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime dueDate;
  TodoStatus status;

  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.status = TodoStatus.incomplete,
  }):createdTime = DateTime.now();

}