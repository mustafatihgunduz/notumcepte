import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:notumcepte/ui/creditcard/credit_card.dart';
import 'package:notumcepte/ui/favorite/my_favorites.dart';
import 'package:notumcepte/ui/helpandsupport/help_and_support.dart';
import 'package:notumcepte/ui/home/utils/custom_list_tile.dart';
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

  bool isHidden = false;

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
      shape: Border.all(style: BorderStyle.none),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
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
            child: const Divider(),
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
    final TextEditingController searchEditingController =
        TextEditingController();

    final List<Widget> trailingWidget = [
      SizedBox(
        width: K.kSizedBoxWidth,
      ),
      Icon(
        Icons.filter_list,
        size: K.kIconSize,
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
              side: WidgetStateProperty.all(BorderSide.none),
              shape: WidgetStateProperty.all(const RoundedRectangleBorder()),
              backgroundColor: WidgetStateProperty.all(Colors.white),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              leading: Icon(Icons.search, color: K.kIconColor),
              trailing: trailingWidget,
              hintStyle: WidgetStatePropertyAll(
                TextStyle(color: K.kTextColor),
              ),
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
                  child: const Text('Vazgeç'))
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
    return Container(
      constraints: BoxConstraints(
        maxHeight: systemHeight >= 2400
            ? SizeConfig.screenHeight! * 0.3
            : SizeConfig.screenHeight! * 0.35,
        minWidth: double.infinity,
      ),
      decoration: const BoxDecoration(color: Colors.white),
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
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Tümünü Görüntüle",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.blueAccent,
                        ),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black87),
                          ),
                          Text(
                            "Mustafa Fatih",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildSpecialForYouArea() {
    var systemHeight = View.of(context).display.size.height.toInt();
    return Container(
      constraints: BoxConstraints(
        maxHeight: systemHeight >= 2400
            ? SizeConfig.screenHeight! * 0.3
            : SizeConfig.screenHeight! * 0.35,
        minWidth: double.infinity,
      ),
      decoration: const BoxDecoration(color: Colors.white),
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
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Tümünü Görüntüle",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.blueAccent,
                        ),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black87),
                          ),
                          Text(
                            "Mustafa Fatih",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
