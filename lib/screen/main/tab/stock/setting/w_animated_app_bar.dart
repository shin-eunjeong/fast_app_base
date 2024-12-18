import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/w_arrow.dart';

/*설정에서 에니메이션 구현위해 appbar를 분리함.*/
class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;

  const AnimatedAppBar(this.title, {
    super.key,
    required this.scrollController,
    required this.animationController,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> with SingleTickerProviderStateMixin{
  // AnimationController 구현하기 위한 SingleTickerProviderStateMixin
  Duration get duration => 10.ms; //시간을 설정할 값인데 필요시 get 으로 다시가져올 수 있게 변경
  double scrollPosition = 0;
  // 애니메이션 사용할 객체 late는 필요할때 초기화 됨. widget이 get이라 late 꼭 필요 //Animation<double> 로 해도 됨.
  late CurvedAnimation animation = CurvedAnimation(parent: widget.animationController, curve: Curves.bounceInOut);

  @override
  void initState() {
    //애니메이션을 수행할 리스너...호출
    widget.animationController.addListener((){
      setState(() {}); // 있어야만 빌더 함수가 ticker 호출 및 값이 반영 된다.
    });
    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80; //스크롤 위치를 특정하기 위한 값
  //bool get isNotTriggered => !isTriggered;   //스트롤 위치가 변경될때 자연스럽게 글자가 변경되게 수정함..
  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }

    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: context.backgroundColor,
        child: SafeArea(
            child: Stack(
                children: [
                Tap(
                onTap: () {
        Nav.pop(context);
        },
            child: const Arrow(direction: AxisDirection.left))
            .p20(),
        AnimatedContainer(
          duration: duration,
          //padding: EdgeInsets.only(left: getValue(initial, target)? 20:50, top: isNotTriggered? 50 : 15),// 자연스러운 글자 변환을 구현
          padding: EdgeInsets.only(
              left: getValue(20, 50), top: getValue(50, 15)),
          child: AnimatedDefaultTextStyle(
            //움직이는 글자의 스타일 적용
              duration: duration,
              style: TextStyle(
                  fontSize: getValue(30, 18), fontWeight: FontWeight.bold),
              child: widget.title.text.make()),
        ),
//이미지 색상 변경 부분 구현 시작 이지미 움직이는 내용 동시
        Positioned(
          //움직임 적용 전에는 Positioned.fill(  //
          // child:Positioned(
          //  left : animation.valeu;
          left: animation.value *300,   //내가 그냥 오른쪽으로 변경
          child: TweenAnimationBuilder<Color?>(
            //색깔변경이라고 지정 해준다. null 올수 있어서 ? 지정
            duration: 1000.ms,
            tween: ColorTween(
              begin: Colors.green,
              end: isTriggered ? Colors.deepOrange : Colors
                  .green, ////끝나는 시점을 잡아줘야 한다.
            ),
            builder: (context, value, child) =>
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    value ?? Colors.green, BlendMode.modulate,    //value가 없을때 기본값 지정
                  ),
                  child: child,
                ),
            child: Image.asset(
              "$basePath/icon/map_point.png",
              height: 60,
            ),
            //color: value,
            //colorBlendMode: BlendMode.modulate,
          ),
        )],
    )
    ,
    )
    ,
    );
  }
}
/*
*
*
* */
