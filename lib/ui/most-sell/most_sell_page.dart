import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/utility/constants.dart';

class MostSellPage extends StatefulWidget {
  const MostSellPage({super.key});

  @override
  State<MostSellPage> createState() => _MostSellPageState();
}

class _MostSellPageState extends State<MostSellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: K.kAppBarColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: K.kIconSize,
            color: K.kIconColor,
          ),
        ),
        title: Text(
          "En Çok Satanlar",
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: K.kHomePageHorizontalPadding,
              vertical: K.kHomePageVerticalPadding / 2,
            ),
            child: Card(
              color: K.kContainerColor,
              elevation: 2,
              shape: const RoundedRectangleBorder(),
              child: ListTile(
                leading: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: 200,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.medium,
                      image: AssetImage(
                        'assets/uicons/ders-kitap${(index % 5) + 1}.jpg',
                      ),
                    ),
                  ),
                ),
                title: Text(
                  'Bilgisayar Mühendisliğine Giriş',
                  style: K.kListTileTitleTextStyle(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  'Verilen not hakkında kısaca descripton bölümü asfasfasfas',
                  style: K.kListTileSubTitleTextStyle(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: K.kIconColor,
                  size: K.kIconSize,
                ),
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
