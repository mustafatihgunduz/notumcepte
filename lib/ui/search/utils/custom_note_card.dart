import 'package:flutter/material.dart';
import 'package:notumcepte/utility/size_config.dart';

class CustomNoteCard extends StatelessWidget {
  const CustomNoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.black,
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.grey.shade800,
            ),
          ],
        ),
        child: ListTile(
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: SizeConfig.screenWidth! * 0.03,
            color: Colors.white,
          ),
          leading: Container(
            width: SizeConfig.screenWidth! * 0.12,
            height: SizeConfig.screenHeight! * 0.1,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Image.asset("assets/profile-avatar.png"),
          ),
          title: Text(
            "Bilgisayar Mühendisliğine Giriş",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontSize: SizeConfig.screenWidth! * 0.05,
                ),
          ),
          subtitle: Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dönem için en güzel hazırlanmış ders notlarıdır.",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.comment,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                    Text(
                      "17 Yorum",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
