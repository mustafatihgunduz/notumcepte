import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/common/custom_dropdownbutton.dart';
import 'package:notumcepte/common/custom_textformfield.dart';
import 'package:notumcepte/utility/constants.dart';

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
  int currentStep = 0;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _facultyController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _classController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordCheckController.dispose();
    _passwordController.dispose();
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
      appBar: AppBar(
        backgroundColor: K.kAppBarColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: K.kIconSize,
            color: K.kIconColor,
          ),
        ),
        title: Text("Kayıt ol", style: K.kAppbarTextStyle(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stepper(
                onStepContinue: () {
                  setState(() {
                    if (currentStep != 2) {
                      currentStep += 1;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (currentStep != 0) {
                      currentStep -= 1;
                    }
                  });
                },
                currentStep: currentStep,
                connectorColor: const WidgetStatePropertyAll(Colors.green),
                steps: [
                  Step(
                    isActive: true,
                    title: Text(
                      'Kullanıcı Bilgileri',
                      style: K.kRegistirationTextStyle(context),
                    ),
                    content: Form(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'Email',
                            controller: _emailController,
                          ),
                          CustomTextFormField(
                            hintText: 'Şifre',
                            controller: _passwordController,
                          ),
                          CustomTextFormField(
                            hintText: 'Şifre Tekrarı',
                            controller: _passwordCheckController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    title: Text(
                      'Eğitim Bilgileri',
                      style: K.kRegistirationTextStyle(context),
                    ),
                    content: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: K.kHomePageHorizontalPadding,
                            vertical: K.kHomePageVerticalPadding,
                          ),
                          child: CustomDropdownButton(
                            items: universityItems,
                            selectedValue: universitySelectedValue,
                            controller: _universityController,
                            hintText: 'Üniversite',
                            searchHintText: 'Üniversite Ara..',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: K.kHomePageHorizontalPadding,
                            vertical: K.kHomePageVerticalPadding,
                          ),
                          child: CustomDropdownButton(
                            items: facultyItems,
                            selectedValue: facultySelectedValue,
                            controller: _facultyController,
                            hintText: 'Fakülte',
                            searchHintText: 'Fakülte Ara..',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: K.kHomePageHorizontalPadding,
                            vertical: K.kHomePageVerticalPadding,
                          ),
                          child: CustomDropdownButton(
                            items: sectionItems,
                            selectedValue: sectionSelectedValue,
                            controller: _sectionController,
                            hintText: 'Bölüm',
                            searchHintText: 'Bölüm Ara..',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: K.kHomePageHorizontalPadding,
                            vertical: K.kHomePageVerticalPadding,
                          ),
                          child: CustomDropdownButton(
                            items: classItems,
                            selectedValue: classSelectedValue,
                            controller: _classController,
                            hintText: 'Sınıf',
                            searchHintText: 'Sınıf Ara..',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Step(
                      title: Text(
                        'Kişisel Bilgiler',
                        style: K.kRegistirationTextStyle(context),
                      ),
                      content: const Column(
                        children: [Text('1')],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
