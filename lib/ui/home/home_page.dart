import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:notumcepte/common/carousel_slider.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomCarouselSlider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => login(context, "email", "password"),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.screenWidth! * 0.025,
                      right: SizeConfig.screenWidth! * 0.025,
                    ),
                    child: Container(
                      width: SizeConfig.screenWidth! * 0.45,
                      height: SizeConfig.screenHeight! * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.screenWidth! * 0.025,
                  ),
                  child: Container(
                    width: SizeConfig.screenWidth! * 0.45,
                    height: SizeConfig.screenHeight! * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                          BorderRadius.circular(SizeConfig.screenWidth! * 0.03),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight! * 0.025,
                horizontal: SizeConfig.screenWidth! * 0.025,
              ),
              child: Container(
                width: SizeConfig.screenWidth!,
                height: SizeConfig.screenHeight! * 0.17,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.screenWidth! * 0.03),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
