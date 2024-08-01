import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/utility/constants.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        title: Text(
          'İstek Listem',
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
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: K.kHomePageHorizontalPadding),
            child: Text(
              'Şu anda istek listeniz boş gözüküyor. Daha sonrasında ulaşmak istediğiniz notları takibe alın',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: K.kTextColor),
            ),
          )
        ],
      ),
    );
  }
}
