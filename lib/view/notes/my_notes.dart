import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/view/addnote/add_note_screen.dart';
import 'package:notumcepte/view/home/home_page.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:provider/provider.dart';

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
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    return Scaffold(
      backgroundColor:
          isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? K.kdarkAppBarColor : K.kwhiteAppBarColor,
        title: Text(
          'Notlarım',
          style: K.kAppbarTextStyle(context),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
            size: K.kIconSize,
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? K.kdarkScaffoldBodyColor
                : K.kwhiteScaffoldBodyColor,
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
                        onPressed: () => Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        ),
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
                        onPressed: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const AddNoteScreen(),
                          ),
                        ),
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
