import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/utility/constants.dart';

class WhyNotumCepte extends StatelessWidget {
  const WhyNotumCepte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        title: Text(
          "Neden Notum Cepte ?",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: K.kExpansionTextColor),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBodyArea(context),
          ],
        ),
      ),
    );
  }

  Column _buildBodyArea(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          shape: Border.all(width: 0, color: Colors.transparent),
          title: Text(
            "Güvenilir ve Kaliteli İçerik",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          children: [
            Text(
              "Platformumuzda yer alan tüm notlar, kalite ve güvenilirlik"
              "açısından titizlikle incelenmiştir. Öğrencilerden gelen geri bildirimlerle sürekli"
              "güncellenen ve doğrulanan içerikler sayesinde en doğru bilgiyi sunmayı hedefliyoruz.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: K.kExpansionTextColor),
            ),
          ],
          childrenPadding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
        ),
        ExpansionTile(
          shape: Border.all(width: 0, color: Colors.transparent),
          title: Text(
            "Zaman ve Enerji Tasarrufu",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          children: [
            Text(
              "Akademik hayat yoğun ve stresli olabilir. Not alışverişi ile zaman kazanarak "
              "derslerinize daha fazla odaklanabilir ve verimliliğinizi artırabilirsiniz.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: K.kExpansionTextColor),
            ),
          ],
          childrenPadding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
        ),
        ExpansionTile(
          shape: Border.all(width: 0, color: Colors.transparent),
          title: Text(
            "Kolay Kullanım ve Erişim",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          children: [
            Text(
              "Kullanıcı dostu arayüzümüz sayesinde ihtiyaç duyduğunuz notlara hızlıca ulaşabilir, dilediğiniz"
              "zaman dilediğiniz yerden erişim sağlayabilirsiniz. Mobil uyumluluk ile her an yanınızdayız.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: K.kExpansionTextColor),
            ),
          ],
          childrenPadding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
        ),
        ExpansionTile(
          shape: Border.all(width: 0, color: Colors.transparent),
          title: Text(
            "Geniş Çeşitlilik",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          children: [
            Text(
              "Farklı fakülteler ve bölümlerden öğrencilerin notlarını içeren geniş bir veri tabanımız var."
              "Aradığınız konu veya ders ne olursa olsun, ihtiyacınızı karşılayacak notları burada bulabilirsiniz.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: K.kExpansionTextColor),
            ),
          ],
          childrenPadding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
        ),
        ExpansionTile(
          shape: Border.all(width: 0, color: Colors.transparent),
          title: Text(
            "Öğrenci Topluluğu",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          children: [
            Text(
              "Platformumuz, sadece not alışverişi değil, aynı zamanda bir öğrenci topluluğu oluşturmayı da hedefler."
              "Diğer öğrencilerle etkileşim kurarak bilgi alışverişinde bulunabilir ve akademik çevrenizi genişletebilirsiniz.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: K.kExpansionTextColor),
            ),
          ],
          childrenPadding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
        ),
        ExpansionTile(
          shape: Border.all(width: 0, color: Colors.transparent),
          title: Text(
            "Ek Gelir Fırsatı",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          children: [
            Text(
              "Kendi notlarınızı satarak ekstra gelir elde etme şansına sahip olursunuz."
              "Böylece hem diğer öğrencilere yardımcı olabilir hem de kazanç sağlayabilirsiniz.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: K.kExpansionTextColor),
            ),
          ],
          childrenPadding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
        ),
        ExpansionTile(
          shape: Border.all(width: 0, color: Colors.transparent),
          title: Text(
            "Güvenli Alışveriş",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          children: [
            Text(
              "Ödeme işlemlerinizin güvenliği bizim için önceliklidir."
              "Güvenli ödeme sistemlerimiz sayesinde rahatça alışveriş yapabilirsiniz.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: K.kExpansionTextColor),
            ),
          ],
          childrenPadding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
        ),
      ],
    );
  }
}
