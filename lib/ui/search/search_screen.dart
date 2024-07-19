import 'package:flutter/material.dart';
import 'package:notumcepte/ui/search/utils/custom_note_card.dart';
import 'package:notumcepte/utility/size_config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.screenHeight! * 0.1,
        title: Center(
          child: Column(
            children: [
              Text(
                "Arama",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchBar(
                    hintText: "Ders adı arayınız...",
                    constraints: BoxConstraints(
                      maxWidth: SizeConfig.screenWidth! * 0.7,
                      minWidth: SizeConfig.screenWidth! * 0.5,
                      minHeight: SizeConfig.screenHeight! * 0.05,
                      maxHeight: SizeConfig.screenHeight! * 0.06,
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth! * 0.15,
                    height: SizeConfig.screenHeight! * 0.05,
                    child: Icon(Icons.filter_list),
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                            spreadRadius: 0.1,
                            color: Colors.grey.shade800,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight! * 0.04,
          horizontal: SizeConfig.screenWidth! * 0.02,
        ),
        child: Column(
          children: [
            CustomNoteCard(),
          ],
        ),
      ),
    );
  }
}
