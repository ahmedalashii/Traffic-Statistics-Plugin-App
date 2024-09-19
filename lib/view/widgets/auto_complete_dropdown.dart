import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/constants/colors.dart';

import 'primary_text.dart';

class AutoCompleteDropdown extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
  final List<String> suggestions;
  final bool isAccess;
  const AutoCompleteDropdown(
      {required this.focusNode,
      required this.controller,
      required this.hintText,
      required this.suggestions,
      this.isAccess = false});

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      focusNode: focusNode,
      controller: controller,
      // textFieldConfiguration: TextFieldConfiguration(
      //   style: TextStyle(color: Colors.black),
      //   decoration: InputDecoration(
      //     hintText: hintText,
      //     hintStyle: TextStyle(
      //       color: Colors.grey.shade400,
      //       fontSize: 14.sp,
      //     ),
      //     enabledBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(color: Color(0xFFDFDFEA)),
      //     ),
      //     focusedBorder: UnderlineInputBorder(
      //       borderSide: BorderSide(color: primaryColor),
      //     ),
      //   ),
      // ),
      suggestionsCallback: (pattern) {
        List<String> matches = <String>[];
        matches.addAll(suggestions);
        matches.retainWhere(
            (s) => s.toLowerCase().contains(pattern.toLowerCase()));
        return matches;
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: PrimaryText(
            suggestion.toString(),
            fontSize: 15,
            color: Colors.black87,
          ),
        );
      },
      onSelected: (suggestion) {
        controller.text = suggestion.toString();
      },
    );
  }
}
