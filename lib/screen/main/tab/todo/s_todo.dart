import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/common/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/todo/d_write_todo.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_list.dart';
import 'package:fast_app_base/screen/main/w_menu_drawer.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  final bool isShowBackButton;
  const TodoScreen({
    Key? key,
    this.isShowBackButton = true,
  }) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // 뒤로가기 동작을 허용
          return true;
        },
        child: Scaffold(
          extendBody: MainScreenState.extendBody,
          drawer: const MenuDrawer(),
          body: Stack(
            children:[
              Container(
                color: context.appColors.seedColor.getMaterialColorValues[200],
                padding: EdgeInsets.only(bottom: MainScreenState.extendBody ? 60 -
                    MainScreenState.bottomNavigationBarBorderRadius: 0 ),
                child: SafeArea(
                  bottom: !MainScreenState.extendBody,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: ()=>Scaffold.of(context).openDrawer(),
                                icon: const Icon(Icons.menu),)
                          ],
                        ),
                        Expanded(child: const TodoList().pSymmetric(h:15)),
                      ],
                    ),

                  ),
                ),
              ),
              Positioned(
                right: 16, // 왼쪽 정렬 (16은 기본 마진 값, 필요에 따라 조정)
                bottom: MainScreenState.bottomNavigationHeight + 10, // FAB 위치 조정
                //right: MediaQuery.of(context).size.width /2 -28, // FAB 중앙 정렬
                child: FloatingActionButton(
                  onPressed: () async{
                    context.todoHolder.addTodo();
                    //다이얼로그 값을 반환받아서. 구문이였으나 todoHolder에서 모두 처리하도록 변경
                    // final result =await WriteTodoDialog().show();
                    // if(result != null && mounted){
                    //   //화면이 살아있을 않을 경우 문제가 되어서 mounted까지 추가
                    //   //TodoDataHolder.of(context).notifier.addTodo(Todo( //context객체에서 불러올 수 있도록 변경함.
                    //   context.todoHoloder.notifier.addTodo(Todo(
                    //     id: DateTime.now().microsecondsSinceEpoch,
                    //     title:result.text,
                    //     dueDate:result.dateTime,
                    //   ));
                    // }
                  },
                  child: Icon(EvaIcons.plus),),)
            ] 
          ),
          
        )

    );
  }
}
