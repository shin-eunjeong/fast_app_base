import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock_.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/s_setting.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../common/widget/w_image_button.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin{
  //하단에 화면 탭을 선택시 컨트롤할 객체
  /* vsync에는  TickerProvider 넣어야 하고
  *SingleTickerProviderStateMixin 통해 _StockFragmentState를  티코프로바이더롤 만들었으나
  * 생성중인 과정은 만들어 진것이 아니므로 this객체로 단순한게 넣을 수 가 없기 때문에
  TabController? tabController;
  @override
  void initState(){
    tabController= TabController(length: 2, vsync: this);
    super.initState();
  }
  * 넣을 수도 있으나 late선언하면 필요한 시점에 초기화 하게 됨.
  * */
  late final TabController tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;  //탭 선택에 따른 분기처리 위한 값
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.appColors.roundedLayoutBackGround,
            pinned: true,   //silver를 상단 고정하는 값
            actions: [
              ImageButton(
                imagePath: '$basePath/icon/stock_search.png',
                onTap: (){
                  Nav.push(const SearchStockScreen());
                  },
              ),
              ImageButton(
                imagePath: '$basePath/icon/stock_calendar.png',
                onTap: (){context.showSnackbar('캘린더');},
              ),
              ImageButton(
                imagePath: '$basePath/icon/stock_settings.png',
                onTap: (){
                  Nav.push(SettingScreen());
                  },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                title,
                tabBar,
                if(currentIndex == 0 )
                  const MyStockFragment()
                else
                  const TodaysDiscoveryFragment()
              ],
            ),
          )
        ],

      ),
    );
  }

  Widget get title => Container(
    color : context.appColors.roundedLayoutBackGround,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        '토스증권'.text.size(24).bold.make(),
        width20,
        'SAP 500'.text.size(13).bold.color(context.appColors.lessImportant).make(),
        width10,
        3919.29.toComma().text.size(13).color(context.appColors.plus).make(),
      ],
    ).pOnly(left: 20),
  );

  Widget get tabBar => Container(
    color : context.appColors.roundedLayoutBackGround,
    child: Column(
      children: [
        TabBar(
          onTap: (index){
            setState(() {
              currentIndex = index;
            });

          },
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelPadding: const EdgeInsets.symmetric(vertical: 20),
          indicatorColor: Colors.white,
          indicatorWeight: 5,  // 두께 조절
          indicatorSize: TabBarIndicatorSize.tab, // 라벨길이에 맞춰서 나와서 tab기준으로 변경함
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
          controller: tabController,  //차후 빌드후에 tabController가 필요하다고 할때 초기화 할 수 있게 됨.
          tabs: [
            '내 주식'.text.make(),
            '오늘의 발견'.text.make(),
           ],
        ),
        const Line(),
      ],
    ),
  );


}

