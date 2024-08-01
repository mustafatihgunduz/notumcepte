// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
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
    var height = View.of(context).display.size.height;

    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
          ),
        ),
        title: Text('Ödeme ekranı', style: K.kAppbarTextStyle(context)),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            height: SizeConfig.screenHeight! * 0.27,
            width: double.infinity,
            isHolderNameVisible: true,
            cardBgColor: Color(0xffD4AF37),
            cardNumber: _cardNumberController.text,
            cardHolderName: "",
            expiryDate: "",
            cvvCode: "",
            showBackView: true,
            onCreditCardWidgetChange: (p0) {},
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: K.kHomePageHorizontalPadding,
              vertical: K.kHomePageVerticalPadding,
            ),
            width: double.infinity,
            height: height < 2400
                ? SizeConfig.screenHeight! * 0.5
                : SizeConfig.screenHeight! * 0.42,
            decoration: BoxDecoration(color: Colors.white),
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
                      label: Text("Kart Numarası"),
                      hintText: cardNumberHintText,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey.shade400,
                        ),
                      ),
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
                            label: Text("Son Kullanma Tarihi"),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                              color: Colors.grey.shade400,
                            )),
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
                            label: Text("CVV"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
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
                      label: Text("Kart Sahibi Adı"),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding * 2,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                            Colors.transparent.withOpacity(0.4)),
                        textStyle: WidgetStatePropertyAll(
                          TextStyle(color: Colors.black),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xffD4AF37),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Öde'),
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
