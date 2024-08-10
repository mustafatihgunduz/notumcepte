import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/ui/addnote/add_note_screen.dart';
import 'package:notumcepte/ui/home/home_page.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({super.key});

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: K.kAppBarColor,
        title: Text(
          'Notlarım',
          style: K.kAppbarTextStyle(context),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
            size: K.kIconSize,
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: K.kScaffoldBodyColor,
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Şu anda satın aldığınız bir not bulunmamaktadır. \nHadi notları keşfedelim',
                        textAlign: TextAlign.center,
                        style: K.kExplanationTextStyle(context),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.02,
                      ),
                      CupertinoButton(
                        color: K.kButtonColor,
                        onPressed: () => Get.offAll(const HomePage()),
                        child: Text(
                          'Notları Keşfet',
                          style: K.kButtonTextStyle(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Şu anda sattığınız bir not bulunmamaktadır. Diğer öğrencilerin notlarınıza erişmesini istiyorsanız not yükleme ekranına gidiniz',
                        textAlign: TextAlign.center,
                        style: K.kExplanationTextStyle(context),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.02,
                      ),
                      CupertinoButton(
                        color: K.kButtonColor,
                        onPressed: () => Get.to(const AddNoteScreen()),
                        child: Text(
                          'Not Yükleme',
                          style: K.kButtonTextStyle(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        TabBar(
          indicatorColor: K.kButtonColor,
          labelColor: K.kButtonColor,
          labelStyle: K.kTabBarTextStyle(context),
          unselectedLabelColor: Colors.grey.shade400,
          overlayColor: WidgetStateColor.transparent,
          dividerHeight: 0,
          controller: _tabController,
          tabs: const [
            Text(
              'Alınan Notlar',
            ),
            Text(
              'Satılan Notlar',
            ),
          ],
        ),
      ]),
    );
  }
}
