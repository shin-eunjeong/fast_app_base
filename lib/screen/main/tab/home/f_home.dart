import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/banks_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_rive_like_button.dart';
import 'package:fast_app_base/screen/main/tab/home/w_ttoss_app_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:live_background/object/palette.dart';
import 'package:live_background/widget/live_background_widget.dart';

import '../../../../common/widget/w_big_button.dart';
import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

class HomeFragment extends StatefulWidget {
  //원래는 StatelessWidget 는데 좋아요 기능 때문에 StatefulWidget 변경
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isLike = false; //좋아요 변수
  int count = 0;
  bool isStreamCompleted = false; // 스트림이 완료되었는지 여부
  final StreamController<int> _countController = StreamController<int>();
  late Stream<int> _countStream;

  @override
  void initState() {
    super.initState();

    // countStream을 초기화하여 스트림을 단일 생명주기로 보장
    _countStream = countStream(5);
  }
  @override
  void dispose() {
    _countController.close();
    super.dispose();
  }

  //스트림 때문에 만듬 함수
  Stream<int> countStream(int max) async* {
    await Future.delayed(Duration(seconds: 2)); // 2초 대기
    for (int i = 1; i <= max; i++) {
      yield i; // 값 발행
      await Future.delayed(Duration(seconds: 2)); // 2초 간격으로 값 발행
    }
    isStreamCompleted = true; // 스트림 종료
  }

  void addDataTotheSink() async{
    // StreamController<int> _countController = StreamController<int>();
    await Future.delayed(2.seconds, () => {});
    _countController.sink.add(count++);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      //웹바영역과 스크롤 영역을 분리한다.
      // stack은 두가지 영역을 표시할 수 있음.
      child: Stack(
        children: [
          //백그라운드 움직이는 이미지 넣기...
          const LiveBackgroundWidget(
            palette: Palette(colors: [Colors.red, Colors.green]), //색깔변경
            velocityX: 5, //속도
            particleMaxSize: 50, //원의 크기
          ),
          RefreshIndicator(
            //화면을 당겼다가 놓으면 새로고침 기능으로 비동기 async() 이용
            edgeOffset: TtossAppBar.appBarHeight, // 반복되는 상수를 통일해서 사용함.
            onRefresh: () async {
              await sleepAsync(NumDurationExtension(500).ms);
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: TtossAppBar.appBarHeight,
                  bottom: MainScreenState.bottomNavigationHeight),
              // 고정되어야할 top메뉴와 하단 높이값을 각각의 화면에서 상수값으로 설정하여 지정함.
              child: Column(
                children: [
                  StreamBuilder<int>(
                    stream: _countStream,     //좋아요가 제대로 동작을 안해서 controller로 변경
                    builder: (context,snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox(
                          height: 250,
                          width: 250,
                          child: RiveLikeButton(
                            isLike,
                            onTapLike: (isLike) {
                              setState(() {
                                this.isLike = isLike;
                              });
                            },
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return Text(
                          'Count: ${snapshot.data}',
                          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return const Text("No Data");
                      }

                    },
                  ),
                 /* SizedBox(
                    //좋아요 버튼 구성 예제 ,,  꼭 사이즈를 지정해야 한다.
                    height: 250,
                    width: 250,
                    child: RiveLikeButton(
                      isLike,
                      onTapLike: (isLike) {
                        setState(() {
                          this.isLike = !isLike;
                        });
                      },
                    ),
                  ),*/
                  BigButton(
                    "토스뱅크",
                    onTap: () {
                      context.showSnackbar("토스뱅크를 눌렀어요");
                    },
                  ),
                  height10,
                  RoundedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "자산".text.bold.white.make(),
                        height5,
                        ...bankAccounts
                            .map((e) => BankAccountWidget(e))
                            .toList()
                      ],
                    ),
                  )
                ],
              )
                  .pSymmetric(h: 20)
                  .animate()
                  .slideY(duration: NumDurationExtension(3000).ms)
                  .fadeIn(),
            ),
          ),

          const TtossAppBar(),
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'
              .text
              .white
              .size(13)
              .make()
              .centered()
              .pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: Colors.yellow.shade300,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}


