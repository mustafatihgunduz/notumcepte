import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:notumcepte/ui/creditcard/credit_card.dart';
import 'package:notumcepte/ui/favorite/my_favorites.dart';
import 'package:notumcepte/ui/helpandsupport/help_and_support.dart';
import 'package:notumcepte/ui/home/utils/custom_list_tile.dart';
import 'package:notumcepte/ui/authentacation/login/login.dart';
import 'package:notumcepte/ui/notes/my_notes.dart';
import 'package:notumcepte/ui/notifications/notifications.dart';
import 'package:notumcepte/ui/profile/profile_screen.dart';
import 'package:notumcepte/ui/settings/settings.dart';
import 'package:notumcepte/ui/whynotumcepte/why_notum_cepte.dart';
import 'package:notumcepte/ui/wishlist/wishlist.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: K.kScaffoldBodyColor,
      drawer: _buildDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              isHidden ? const Opacity(opacity: 0) : _buildAppBarSide(),
              _buildSearchArea(),
              isHidden ? const Opacity(opacity: 0) : _buildCarouselSlider(),
              isHidden ? const Opacity(opacity: 0) : _buildMostSellArea(),
              isHidden ? const Opacity(opacity: 0) : _buildSpecialForYouArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: K.kScaffoldBodyColor,
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
                              color: K.kIconColor,
                            ),
                            TextButton(
                              onPressed: () => Get.to(LoginPage()),
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
            onTap: () => Get.to(const ProfileScreen()),
            titleText: "Hesabım",
            leadingIcon: Icons.person,
          ),
          CustomListTile(
            onTap: () => Get.to(const MyNotes()),
            titleText: "Notlarım",
            leadingIcon: Icons.edit_document,
          ),
          CustomListTile(
            onTap: () => Get.to(const CreditCardScreen()),
            titleText: "Kart İşlemleri",
            leadingIcon: Icons.credit_card,
          ),
          CustomListTile(
            onTap: () => Get.to(const MyFavorites()),
            titleText: "Favorilerim",
            leadingIcon: Icons.favorite,
          ),
          CustomListTile(
            onTap: () => Get.to(const Wishlist()),
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
            onTap: () => Get.to(const WhyNotumCepte()),
            leadingIcon: Icons.whatshot,
            titleText: "Neden Notum Cepte ?",
          ),
          CustomListTile(
            onTap: () => Get.to(const HelpAndSupportPage()),
            titleText: "Yardım ve Destek",
            leadingIcon: Icons.help,
          ),
          CustomListTile(
            onTap: () => Get.to(const SettingsPage()),
            titleText: "Ayarlar",
            leadingIcon: Icons.settings,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarSide() {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight! * 0.07,
      decoration: BoxDecoration(
        color: K.kContainerColor,
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
                color: K.kIconColor,
              ),
            ),
            Icon(
              Icons.abc,
              color: K.kIconColor,
            ),
            GestureDetector(
              onTap: () => Get.to(const Notifications()),
              child: Icon(
                Icons.notifications,
                color: K.kIconColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchArea() {
    final List<Widget> trailingWidget = [
      Icon(
        Icons.filter_list,
        size: K.kIconSize,
        color: K.kIconColor,
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
              backgroundColor: WidgetStateProperty.all(K.kContainerColor),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              leading: Icon(
                Icons.search,
                color: K.kIconColor,
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

  Widget _buildCarouselSlider() {
    final List<String> carouselSliderItems = [
      "https://i.dr.com.tr/pimages/Content/Uploads/BannerFiles/dr/anasayfa_1200x390-dr190720241346.webp",
      "https://i.dr.com.tr/pimages/Content/Uploads/BannerFiles/dr/anasayfa_1200x390750-uzeri-75-TL-kupon-Firsati-Temmuzz.webp",
      "https://i.dr.com.tr/pimages/Content/Uploads/BannerFiles/dr/kirtasiye-mayis-dr-anasayfa_1200x390.webp",
      "https://i.dr.com.tr/pimages/Content/Uploads/BannerFiles/dr/anasayfa_1200x390-The-Kitap-3-Kitap-150-TL.webp",
      "https://i.dr.com.tr/pimages/Content/Uploads/BannerFiles/dr/anasayfa_1200x390-Ayin-Yayinevi-Yapi-Kredi-Yayinlari.webp",
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: K.kHomePageHorizontalPadding,
      ),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight! * 0.3,
        child: CarouselSlider(
          items: carouselSliderItems.map((i) {
            final index = carouselSliderItems.indexOf(i);
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    carouselSliderItems[index],
                  ),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayCurve: Curves.easeIn,
              autoPlayInterval: const Duration(seconds: 5),
              disableCenter: true),
        ),
      ),
    );
  }

  Widget _buildMostSellArea() {
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
          color: K.kContainerColor,
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
                    onPressed: () {},
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
        decoration: BoxDecoration(color: K.kContainerColor),
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
                    onPressed: () {},
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
