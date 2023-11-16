import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key, required this.items}) : super(key: key);
  final List<String> items;
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedValue;
  List<String> items = [];
  @override
  void initState() {
    items = widget.items;
    selectedValue = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      value: selectedValue,
      decoration: InputDecoration(
        filled: true,
        fillColor: grey200,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: grey300),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: grey300),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      isExpanded: true,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: grey500,
      ),
      iconSize: 30,
      buttonHeight: 48,
      buttonWidth: 94,
      buttonPadding: const EdgeInsets.only(right: 16, left: 16),
      dropdownDecoration: BoxDecoration(
        color: grey400,
        borderRadius: BorderRadius.circular(16),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: body(color: grey900),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select occupation.';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
      onSaved: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
