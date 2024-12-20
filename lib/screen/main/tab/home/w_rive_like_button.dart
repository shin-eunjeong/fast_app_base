import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLikeButton extends StatefulWidget {
  final bool isLike;      //다른 내용과 중복하니 영향을 받아서 내부에서 처리하는 것으로 수정함.
  final void Function(bool isLike) onTapLike;
  const RiveLikeButton(this.isLike, {super.key, required this.onTapLike });

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {
  late StateMachineController stateMachineController;
  late SMIBool smiPressed;  // press 기능 컨트롤
  late SMIBool smiHover;    // hover 기능 컨트롤
  late bool _isLike ;

  //isLike 불필요 삭제
  @override
  void initState(){
    _isLike = widget.isLike;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant RiveLikeButton oldWidget) {
    // TODO: implement didUpdateWidget 좋아요 값을 컨드롤 하기 위한함수 , 상위화면에서 setState() 될때 호출
    // isLike 값이 변경되었을 때만 상태 업데이트
    if (oldWidget.isLike != widget.isLike) {
      _isLike = widget.isLike;

      if (smiPressed != null && smiHover != null) {
        // 새로운 isLike 값에 따라 상태 설정
        smiPressed.value = _isLike;
        smiHover.value = _isLike;
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    //좋아요 버튼으로 신규 작성함...기본예제는 참고 만 하길...
    return Tap(
      onTap: (){
        setState(() {
          _isLike = !_isLike; // 상태 업데이트
        });

        widget.onTapLike(_isLike);
        //widget.onTapLike(!widget.isLike);
      },
      child: RiveAnimation.asset(
        "$baseRivePath/light_like.riv",
        stateMachines: ['State Machine'],
        onInit: (Artboard art){
          stateMachineController = StateMachineController.fromArtboard(art, 'State Machine 1')!;
          stateMachineController.isActive = true;
          art.addController(stateMachineController);
          //
          smiPressed = stateMachineController.findInput<bool>('Pressed') as SMIBool; //Pressed 기능. 강제 타입변환
          smiHover = stateMachineController.findInput<bool>('Hover') as SMIBool; //Hover 기능. 강제 타입변환
        },
      ),
    );
  }
}



/*
* 기본 예제 이다.....

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
          controllers: [_controller],
          // Update the play state when the widget's initialized
          onInit: (_) => setState(() {}),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

 */