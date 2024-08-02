// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.hintText,
    required this.searchHintText,
    required this.controller,
  });

  List<String> items = [];
  String? selectedValue;
  String? hintText;
  String? searchHintText;
  late TextEditingController controller;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          widget.hintText!,
          style: K.kDropdownButtonTextStyle(context),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item,
                      style: K.kDropdownButtonMenuItemTextStyle(context)),
                ))
            .toList(),
        value: widget.selectedValue,
        onChanged: (value) {
          setState(() {
            widget.selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade700, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: K.kHomePageHorizontalPadding,
          ),
          height: SizeConfig.screenHeight! * 0.05,
          width: double.infinity,
        ),
        dropdownStyleData: DropdownStyleData(
          openInterval: Interval(0.25, 1),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          maxHeight: SizeConfig.screenHeight! * 0.3,
          width: SizeConfig.screenWidth! * 0.8,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: SizeConfig.screenHeight! * 0.06,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: widget.controller,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: SizeConfig.screenHeight! * 0.07,
            padding: EdgeInsets.symmetric(
              horizontal: K.kHomePageHorizontalPadding,
              vertical: K.kHomePageVerticalPadding,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: widget.controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: K.kHomePageHorizontalPadding,
                  vertical: K.kHomePageVerticalPadding,
                ),
                hintText: widget.searchHintText!,
                hintStyle: K.kDropdownButtonTextStyle(context),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value.toString().toLowerCase().contains(searchValue);
          },
        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            widget.controller.clear();
          }
        },
      ),
    );
  }
}
