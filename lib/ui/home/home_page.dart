import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/ui/home/utils/custom_list_tile.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: K.kScaffoldBodyColor,
      drawer: _buildDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBarSide(),
            _buildSearchArea(),
            _buildCarouselSlider(),
            _buildBodyArea()
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      shape: Border.all(style: BorderStyle.none),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Mustafa Fatih Gündüz"),
            accountEmail: Text("notumcepte@gmail.com"),
            currentAccountPicture: ClipOval(
              child: Image.asset("assets/profile-avatar.png"),
            ),
          ),
          CustomListTile(
            titleText: "Hesabım",
            leadingIcon: Icons.person,
          ),
          CustomListTile(
            titleText: "Notlarım",
            leadingIcon: Icons.edit_document,
          ),
          CustomListTile(
            titleText: "Kart İşlemleri",
            leadingIcon: Icons.credit_card,
          ),
          CustomListTile(
            titleText: "Favorilerim",
            leadingIcon: Icons.favorite,
          ),
          CustomListTile(
            titleText: "Bildirimler",
            leadingIcon: Icons.notification_important,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * 0.045,
            ),
            child: Divider(),
          ),
          CustomListTile(
            titleText: "Yardım ve Destek",
            leadingIcon: Icons.help,
          ),
          CustomListTile(
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
              onTap: () => _scaffoldKey.currentState!.openDrawer(),
              child: Icon(
                Icons.menu,
                color: K.kIconColor,
              ),
            ),
            Icon(
              Icons.abc,
              color: K.kIconColor,
            ),
            Icon(
              Icons.notifications,
              color: K.kIconColor,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchArea() {
    final TextEditingController _searchEditingController =
        TextEditingController();

    final List<Widget> trailingWidget = [
      GestureDetector(
        onTap: () {
          _searchEditingController.text = "";
        },
        child: Icon(
          Icons.clear,
          size: K.kIconSize,
        ),
      ),
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
      child: SearchBar(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        controller: _searchEditingController,
        side: WidgetStateProperty.all(BorderSide.none),
        shape: WidgetStateProperty.all(RoundedRectangleBorder()),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        leading: Icon(Icons.search, color: K.kIconColor),
        trailing: trailingWidget,
        hintStyle: WidgetStatePropertyAll(
          TextStyle(color: K.kTextColor),
        ),
        hintText: "Ders Notu Ara...",
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
      child: Container(
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
              autoPlayInterval: Duration(seconds: 5),
              disableCenter: true),
        ),
      ),
    );
  }

  _buildBodyArea() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.screenHeight! * 0.25,
          decoration: BoxDecoration(color: Colors.white),
        ),
      ],
    );
  }
}
