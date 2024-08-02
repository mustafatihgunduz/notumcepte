import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/common/custom_dropdownbutton.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<String> universityItems = [
    'Boğaziçi Üniversitesi',
    'Koç Üniversitesi',
    'Konya Teknik Üniversitesi',
    'Karatay Teknik Üniversitesi',
    'İstanbul Teknik Üniversitesi',
    'Orta Doğu Teknik Üniversitesi',
    'Karadeniz Teknik Üniversitesi',
    'Selçuk Üniversitesi',
  ];
  final List<String> facultyItems = [
    'Mühendislik Fakültesi',
    'Tıp Fakültesi',
    'İletişim Fakültesi',
    'Mimarlık Fakültesi',
    'Güzel Sanatlar Fakültesi',
    'Fen Edebiyat Fakültesi',
    'Hukuk Fakültesi',
    'Dişçilik Fakültesi',
  ];
  final List<String> sectionItems = [
    'Bilgisayar Mühendisliği',
    'Elektrik-Elektronik Mühendisliği',
    'Makine Mühendisliği',
    'Metalurji Mühendisliği',
    'Mekatronik Mühendisliği',
    'Harita Mühendisliği',
    'Hukuk',
    'Tıp',
  ];
  final List<String> classItems = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];

  String? universitySelectedValue;
  String? facultySelectedValue;
  String? sectionSelectedValue;
  String? classSelectedValue;
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _facultyController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _classController = TextEditingController();

  @override
  void dispose() {
    _universityController.dispose();
    _classController.dispose();
    _facultyController.dispose();
    _sectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropdownButton(
                  items: universityItems,
                  selectedValue: universitySelectedValue,
                  controller: _universityController,
                  hintText: 'Üniversite',
                  searchHintText: 'Üniversite Ara..',
                ),
                CustomDropdownButton(
                  items: facultyItems,
                  selectedValue: facultySelectedValue,
                  controller: _facultyController,
                  hintText: 'Fakükte',
                  searchHintText: 'Fakülte Ara..',
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropdownButton(
                  items: sectionItems,
                  selectedValue: sectionSelectedValue,
                  controller: _sectionController,
                  hintText: 'Bölüm',
                  searchHintText: 'Bölüm Ara..',
                ),
                CustomDropdownButton(
                  items: classItems,
                  selectedValue: classSelectedValue,
                  controller: _classController,
                  hintText: 'Sınıf',
                  searchHintText: 'Sınıf Ara..',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
