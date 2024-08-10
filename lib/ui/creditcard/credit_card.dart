// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  // final GlobalKey<FormState> _creditCardForumKey = GlobalKey();

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardExpireDateController =
      TextEditingController();
  final TextEditingController _cardCvvController = TextEditingController();

  String cardNumberHintText = "Kart Numaranızı Giriniz.";
  bool isDisable = false;

  void _formatCreditCardNumberInput() {
    String text =
        _cardNumberController.text.replaceAll(' ', ''); //* Boşlukları kaldır
    String formattedText = ''; //* Formatlanmış text.

    for (int i = 0; i < text.length; i++) {
      formattedText += text[i];
      if ((i + 1) % 4 == 0 && i + 1 != text.length) {
        formattedText += ' '; //* Her 4 karakterde bir boşluk ekle
      }
    }

    _cardNumberController.value = _cardNumberController.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length));
  }

  void _formatExpireDateInput() {
    String text = _cardExpireDateController.text.replaceAll('/', '');
    String formattedText = '';

    for (int i = 0; i < text.length; i++) {
      formattedText += text[i];
      if ((i + 1) % 2 == 0 && i + 1 != text.length) {
        formattedText += "/";
      }
    }

    _cardExpireDateController.value = _cardExpireDateController.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length));
  }

  void isDisabled() {
    if (_cardHolderNameController.text.isEmpty &&
        _cardNumberController.text.isEmpty &&
        _cardExpireDateController.text.isEmpty &&
        _cardCvvController.text.isEmpty) {
      setState(() {
        isDisable = true;
      });
    } else {
      setState(() {
        isDisable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = View.of(context).display.size.height;

    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: K.kAppBarColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
            size: K.kIconSize,
          ),
        ),
        title: Text(
          'Ödeme ekranı',
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: K.kHomePageHorizontalPadding,
              vertical: K.kHomePageVerticalPadding,
            ),
            width: double.infinity,
            height: height < 2400
                ? SizeConfig.screenHeight! * 0.5
                : SizeConfig.screenHeight! * 0.42,
            decoration: BoxDecoration(
              color: K.kContainerColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding * 2,
                    vertical: K.kHomePageVerticalPadding * 2,
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      _formatCreditCardNumberInput();
                    },
                    onTap: () {
                      setState(() {
                        cardNumberHintText = "XXXX XXXX XXXX XXXX";
                      });
                    },
                    inputFormatters: [LengthLimitingTextInputFormatter(19)],
                    keyboardType: TextInputType.number,
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                      label: Text(
                        "Kart Numarası",
                        style: K.kRegistirationTextStyle(context),
                      ),
                      hintText: cardNumberHintText,
                      border: K.kOutlineInputBorder,
                      errorBorder: K.kErrorOutlineInputBorder,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding * 2,
                    vertical: K.kHomePageVerticalPadding * 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                              5,
                            )
                          ],
                          onChanged: (value) {
                            _formatExpireDateInput();
                          },
                          controller: _cardExpireDateController,
                          decoration: InputDecoration(
                            errorBorder: K.kErrorOutlineInputBorder,
                            label: Text(
                              "Son Kullanma Tarihi",
                              style: K.kRegistirationTextStyle(context),
                            ),
                            border: K.kOutlineInputBorder,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.4,
                        child: TextFormField(
                          onChanged: (value) {},
                          onTap: () {},
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3)
                          ],
                          keyboardType: TextInputType.number,
                          controller: _cardCvvController,
                          decoration: InputDecoration(
                            label: Text(
                              "CVV",
                              style: K.kRegistirationTextStyle(context),
                            ),
                            border: K.kOutlineInputBorder,
                            errorBorder: K.kErrorOutlineInputBorder,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding * 2,
                    vertical: K.kHomePageVerticalPadding * 2,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _cardHolderNameController,
                    decoration: InputDecoration(
                      label: Text(
                        "Kart Sahibi Adı",
                        style: K.kRegistirationTextStyle(context),
                      ),
                      border: K.kOutlineInputBorder,
                      errorBorder: K.kErrorOutlineInputBorder,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding * 2,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: K.kButtonColor,
                      disabledColor: Colors.grey,
                      child: Text(
                        'Öde',
                        style: K.kButtonTextStyle(context),
                      ),
                      onPressed: () {
                        isDisable ? null : Get.back();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
