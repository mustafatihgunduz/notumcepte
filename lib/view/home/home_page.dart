import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/common/carousel_slider.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/view/creditcard/credit_card.dart';
import 'package:notumcepte/view/favorite/my_favorites.dart';
import 'package:notumcepte/view/helpandsupport/help_and_support.dart';
import 'package:notumcepte/view/home/utils/custom_list_tile.dart';
import 'package:notumcepte/view/authentacation/login/login.dart';
import 'package:notumcepte/view/most-sell/most_sell_page.dart';
import 'package:notumcepte/view/notes/my_notes.dart';
import 'package:notumcepte/view/notifications/notifications.dart';
import 'package:notumcepte/view/profile/profile_screen.dart';
import 'package:notumcepte/view/settings/settings.dart';
import 'package:notumcepte/view/special-for-you/special_for_you_page.dart';
import 'package:notumcepte/view/whynotumcepte/why_notum_cepte.dart';
import 'package:notumcepte/view/wishlist/wishlist.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchEditingController = TextEditingController();

  bool isHidden = false;
  bool isUserNull = true;

  @override
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor:
          isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              isHidden ? const Opacity(opacity: 0) : _buildAppBarSide(),
              _buildSearchArea(),
              isHidden
                  ? const Opacity(opacity: 0)
                  : const CustomCarouselSlider(),
              isHidden ? const Opacity(opacity: 0) : _buildMostSellArea(),
              isHidden ? const Opacity(opacity: 0) : _buildSpecialForYouArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    return Drawer(
      backgroundColor:
          isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
      shape: Border.all(style: BorderStyle.none),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          isUserNull
              ? SafeArea(
                  child: Column(
                    children: [
                      CircleAvatar(
                        minRadius: SizeConfig.screenWidth! * 0.1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: K.kHomePageHorizontalPadding * 2,
                          vertical: K.kHomePageVerticalPadding / 2,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.login,
                              color: isDarkMode
                                  ? K.kdarkIconColor
                                  : K.kwhiteIconColor,
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                              child: Text(
                                'Giriş Yap',
                                style: K.kTitleTextStyle(context),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth! * 0.045,
                        ),
                        child: Divider(
                          color: K.kDividerColor,
                        ),
                      ),
                    ],
                  ),
                )
              : UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blueGrey),
                  accountName: const Text("Mustafa Fatih Gündüz"),
                  accountEmail: const Text("notumcepte@gmail.com"),
                  currentAccountPicture: ClipOval(
                    child: Image.asset("assets/profile-avatar.png"),
                  ),
                ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            ),
            titleText: "Hesabım",
            leadingIcon: Icons.person,
          ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const MyNotes(),
              ),
            ),
            titleText: "Notlarım",
            leadingIcon: Icons.edit_document,
          ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const CreditCardScreen(),
              ),
            ),
            titleText: "Kart İşlemleri",
            leadingIcon: Icons.credit_card,
          ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const MyFavorites(),
              ),
            ),
            titleText: "Favorilerim",
            leadingIcon: Icons.favorite,
          ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const Wishlist(),
              ),
            ),
            titleText: "İstek Listesi",
            leadingIcon: Icons.list,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * 0.045,
            ),
            child: Divider(
              color: K.kDividerColor,
            ),
          ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const WhyNotumCepte(),
              ),
            ),
            leadingIcon: Icons.whatshot,
            titleText: "Neden Notum Cepte ?",
          ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const HelpAndSupportPage(),
              ),
            ),
            titleText: "Yardım ve Destek",
            leadingIcon: Icons.help,
          ),
          CustomListTile(
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            ),
            titleText: "Ayarlar",
            leadingIcon: Icons.settings,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarSide() {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight! * 0.07,
      decoration: BoxDecoration(
        color: isDarkMode ? K.kdarkContainerColor : K.kwhiteContainerColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: Icon(
                Icons.menu,
                color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
              ),
            ),
            Icon(
              Icons.abc,
              color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => Notifications()),
              ),
              child: Icon(
                Icons.notifications,
                color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchArea() {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    final List<Widget> trailingWidget = [
      Icon(
        Icons.filter_list,
        size: K.kIconSize,
        color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: K.kHomePageHorizontalPadding,
        vertical: K.kHomePageVerticalPadding,
      ),
      child: Row(
        children: [
          SizedBox(
            width: isHidden
                ? SizeConfig.screenWidth! * 0.7
                : SizeConfig.screenWidth! * 0.93,
            child: SearchBar(
              onTap: () {
                setState(() {
                  isHidden = true;
                });
              },
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              controller: searchEditingController,
              autoFocus: isHidden ? true : false,
              side: WidgetStateProperty.all(K.kSearchBarBorderSide),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                  isDarkMode ? K.kdarkContainerColor : K.kwhiteContainerColor),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              leading: Icon(
                Icons.search,
                color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
                size: K.kIconSize,
              ),
              trailing: trailingWidget,
              hintStyle: WidgetStatePropertyAll(K.kSearchBarTextStyle(context)),
              hintText: "Ders Notu Ara...",
            ),
          ),
          isHidden
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      isHidden = false;
                    });
                  },
                  child: Text(
                    'Vazgeç',
                    style: K.kTitleTextStyle(context),
                  ),
                )
              : const Opacity(opacity: 0)
        ],
      ),
    );
  }

  Widget _buildMostSellArea() {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    var systemHeight = View.of(context).display.size.height.toInt();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: K.kHomePageHorizontalPadding,
        vertical: K.kHomePageVerticalPadding,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: systemHeight >= 2400
              ? SizeConfig.screenHeight! * 0.3
              : SizeConfig.screenHeight! * 0.35,
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          color: isDarkMode ? K.kdarkContainerColor : K.kwhiteContainerColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "En Çok Satanlar",
                    style: K.kContainerTextStyle(context),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const MostSellPage(),
                      ),
                    ),
                    child: Text(
                      "Tümünü Görüntüle",
                      style: K.kTextButtonTextStyle(context),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: K.kHomePageHorizontalPadding,
                      ),
                      child: SizedBox(
                        width: SizeConfig.screenWidth! * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth! * 0.28,
                              height: SizeConfig.screenHeight! * 0.16,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/uicons/ders-kitap${index + 1}.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              "Bilgisayar Mühendisliğine Giriş",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: K.kContainerTextStyle(context),
                            ),
                            Text(
                              "Mustafa Fatih",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: K.kContainerSubtitleTextStyle(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialForYouArea() {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    var systemHeight = View.of(context).display.size.height.toInt();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: K.kHomePageHorizontalPadding,
        vertical: K.kHomePageVerticalPadding,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: systemHeight >= 2400
              ? SizeConfig.screenHeight! * 0.3
              : SizeConfig.screenHeight! * 0.35,
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
            color: isDarkMode ? K.kdarkContainerColor : K.kwhiteContainerColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size Özel",
                    style: K.kContainerTextStyle(context),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const SpecialForYouPage(),
                      ),
                    ),
                    child: Text(
                      "Tümünü Görüntüle",
                      style: K.kTextButtonTextStyle(context),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: K.kHomePageHorizontalPadding,
                      ),
                      child: SizedBox(
                        width: SizeConfig.screenWidth! * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth! * 0.28,
                              height: SizeConfig.screenHeight! * 0.16,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/uicons/ders-kitap${index + 1}.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Text(
                              "Bilgisayar Mühendisliğine Giriş",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: K.kContainerTextStyle(context),
                            ),
                            Text(
                              "Mustafa Fatih",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: K.kContainerSubtitleTextStyle(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
