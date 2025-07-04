import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:provider/provider.dart';

class SpecialForYouPage extends StatefulWidget {
  const SpecialForYouPage({super.key});

  @override
  State<SpecialForYouPage> createState() => _SpecialForYouPageState();
}

class _SpecialForYouPageState extends State<SpecialForYouPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    return Scaffold(
      backgroundColor:
          isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? K.kdarkAppBarColor : K.kwhiteAppBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: K.kIconSize,
            color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
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
              color:
                  isDarkMode ? K.kdarkContainerColor : K.kwhiteContainerColor,
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
                  color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
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
