import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/ui/home/home_page.dart';
import 'package:notumcepte/utility/constants.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({super.key});

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        title: Text(
          'Favoriler',
          style: K.kAppbarTextStyle(context),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Şu anda favorinize aldığınız herhangi bir not bulunmamaktadır.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: K.kTextColor),
          ),
          ElevatedButton(
              onPressed: () => Get.offAll(const HomePage()),
              child: const Text('Notları Keşfet'))
        ],
      ),
    );
  }
}
