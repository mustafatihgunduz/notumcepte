// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  GlobalKey<FormState> _creditCardForumKey = GlobalKey();

  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cardHolderNameController = TextEditingController();
  TextEditingController _cardExpireDateController = TextEditingController();
  TextEditingController _cardCvvController = TextEditingController();

  String cardNumberHintText = "Kart Numaranızı Giriniz.";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              isHolderNameVisible: true,
              cardBgColor: Color(0xffD4AF37),
              cardNumber: _cardNumberController.text,
              cardHolderName: "",
              expiryDate: "",
              cvvCode: "",
              showBackView: true,
              onCreditCardWidgetChange: (p0) {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
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
                  label: Text("Kart Numarası"),
                  hintText: cardNumberHintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
                vertical: K.kHomePageVerticalPadding * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.4,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _formatExpireDateInput();
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                          5,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                        )
                      ],
                      controller: _cardExpireDateController,
                      decoration: InputDecoration(
                        label: Text("Son Kullanma Tarihi"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.4,
                    child: TextFormField(
                      onChanged: (value) {},
                      onTap: () {},
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      keyboardType: TextInputType.number,
                      controller: _cardCvvController,
                      decoration: InputDecoration(
                        label: Text("CVV"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
