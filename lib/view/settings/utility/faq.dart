import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:provider/provider.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
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
            color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
            size: K.kIconSize,
          ),
        ),
        title: Text(
          'Sıkça Sorulan Sorular',
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              shape: Border.all(width: 0, color: Colors.transparent),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              title: Text(
                'Kazancımı nasıl çekebilirim?',
                style: K.kExpansionTitleTextStyle(context),
              ),
              children: [
                Text(
                  'Hesabınızdaki kazançlarınızı banka hesabınıza veya diğer ödeme yöntemleri '
                  'aracılığıyla çekebilirsiniz. Çekim işlemleri için belirli bir alt limit olabilir.',
                  style: K.kExpansionSubtitleTextStyle(context),
                ),
              ],
            ),
            ExpansionTile(
              shape: Border.all(width: 0, color: Colors.transparent),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              title: Text(
                'Gizlilik politikası ve veri güvenliği nasıl sağlanıyor?',
                style: K.kExpansionTitleTextStyle(context),
              ),
              children: [
                Text(
                  'Kullanıcı bilgilerinizin güvenliği bizim için önceliklidir. Verileriniz, '
                  'gelişmiş güvenlik protokolleri ile korunmaktadır ve üçüncü şahıslarla paylaşılmaz.',
                  style: K.kExpansionSubtitleTextStyle(context),
                ),
              ],
            ),
            ExpansionTile(
              shape: Border.all(width: 0, color: Colors.transparent),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              title: Text(
                'Bir sorunla karşılaşırsam ne yapmalıyım?',
                style: K.kExpansionTitleTextStyle(context),
              ),
              children: [
                Text(
                  'Herhangi bir sorunla karşılaştığınızda, '
                  'teknik destek ekibimizle iletişime geçebilirsiniz. Sorunlarınızı çözmek için buradayız.',
                  style: K.kExpansionSubtitleTextStyle(context),
                ),
              ],
            ),
            ExpansionTile(
              shape: Border.all(width: 0, color: Colors.transparent),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              title: Text(
                'Notların kalitesi nasıl sağlanıyor?',
                style: K.kExpansionTitleTextStyle(context),
              ),
              children: [
                Text(
                  'Platformumuzda yer alan notlar, kullanıcı geri bildirimleri ve '
                  'incelemelerle sürekli kontrol edilir. Yüksek kaliteli içerik sağlamayı hedefliyoruz.',
                  style: K.kExpansionSubtitleTextStyle(context),
                ),
              ],
            ),
            ExpansionTile(
              shape: Border.all(width: 0, color: Colors.transparent),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              title: Text(
                'Notların içeriğiyle ilgili bir sorunum olursa ne yapabilirim?',
                style: K.kExpansionTitleTextStyle(context),
              ),
              children: [
                Text(
                  'Notların içeriği ile ilgili şikayet veya sorunlarınızı müşteri hizmetlerine bildirebilirsiniz. '
                  'Gereken incelemeler yapılarak sorununuzu çözmeye çalışacağız.',
                  style: K.kExpansionSubtitleTextStyle(context),
                ),
              ],
            ),
            ExpansionTile(
              shape: Border.all(width: 0, color: Colors.transparent),
              childrenPadding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              title: Text(
                'Notlar hangi formatlarda yüklenebilir?',
                style: K.kExpansionTitleTextStyle(context),
              ),
              children: [
                Text(
                  'Notlarınızı yalnızca PDF formatında yükleyebilirsiniz. '
                  'Detaylı bilgi için yükleme sayfasını ziyaret edebilirsiniz.',
                  style: K.kExpansionSubtitleTextStyle(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
