import 'package:flutter/material.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    List items = [
      'Selçuk Üniversitesi',
      'İstanbul Teknik Üniversitesi',
      'Orta Doğu Teknik Üniversitesi',
      'Karaman Üniversitesi',
      'Selçuk Üniversitesi',
      'İstanbul Teknik Üniversitesi',
      'Orta Doğu Teknik Üniversitesi',
      'Karaman Üniversitesi',
      'Selçuk Üniversitesi',
      'İstanbul Teknik Üniversitesi',
      'Orta Doğu Teknik Üniversitesi',
      'Karaman Üniversitesi',
      'Selçuk Üniversitesi',
      'İstanbul Teknik Üniversitesi',
      'Orta Doğu Teknik Üniversitesi',
      'Karaman Üniversitesi',
      'Selçuk Üniversitesi',
      'İstanbul Teknik Üniversitesi',
      'Orta Doğu Teknik Üniversitesi',
      'Karaman Üniversitesi',
      'Selçuk Üniversitesi',
      'İstanbul Teknik Üniversitesi',
      'Orta Doğu Teknik Üniversitesi',
      'Karaman Üniversitesi'
    ];
    String selectedItem = 'Selçuk Üniversitesi';

    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
                vertical: K.kHomePageVerticalPadding),
            child: Container(
              width: double.infinity,
              height: SizeConfig.screenHeight! / 2,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton(
                          menuMaxHeight: SizeConfig.screenHeight! * 0.3,
                          items: items.map((item) {
                            return DropdownMenuItem(
                              value: selectedItem,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedItem = value as String;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
