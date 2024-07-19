import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:notumcepte/common/carousel_slider.dart';
import 'package:notumcepte/ui/home/utils/auth_container.dart';
import 'package:notumcepte/ui/home/utils/login.dart';
import 'package:notumcepte/utility/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomCarouselSlider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthentacionContainer(
                    imageStr: "assets/uicons/not11.jpg",
                    text: "Giriş Yap",
                  ),
                  AuthentacionContainer(
                    imageStr: "assets/uicons/not14.jpg",
                    text: "Kayıt Ol",
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight! * 0.025,
                    horizontal: SizeConfig.screenWidth! * 0.07,
                  ),
                  child: Container(
                    width: SizeConfig.screenWidth!,
                    height: SizeConfig.screenHeight! * 0.14,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/uicons/not1.jpg",
                          ),
                          fit: BoxFit.cover),
                      border: Border.all(
                        color: Colors.brown.shade400,
                        width: 1,
                      ),
                      borderRadius:
                          BorderRadius.circular(SizeConfig.screenWidth! * 0.03),
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "En Çok Satılanlar",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.grey.shade600),
                        )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialSupportContainer(
                    imageStr: "assets/uicons/not2.jpg",
                    text: "Haberler",
                  ),
                  SocialSupportContainer(
                    imageStr: "assets/uicons/not13.jpg",
                    text: "İletişim",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialSupportContainer extends StatelessWidget {
  final String imageStr;
  final String text;

  SocialSupportContainer({
    super.key,
    required this.imageStr,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.38,
      height: SizeConfig.screenHeight! * 0.15,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.grey.shade200),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.brown.shade400,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageStr),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
