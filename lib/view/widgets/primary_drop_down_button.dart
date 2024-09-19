import 'package:flutter/material.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';

class PrimaryDropDownButton extends StatelessWidget {
  late  String? title;
  final List<String>? items;
  final ValueChanged? onChanged;

   PrimaryDropDownButton({ Key? key,this.title, this.items, this.onChanged}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        hint: PrimaryText(
          title == "" ? 'title' : title!,
          color: Colors.grey,
          fontSize: 14,
        ),
        icon:const Icon(Icons.keyboard_arrow_down_sharp),
        //isDense: true,
        isExpanded: true,
        items: items!.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: PrimaryText(
              value,
              color:Colors.black87,
              fontSize: 14,
            ),
          );
        }).toList(),
        onChanged: onChanged == null
            ? (value) {
                title = value!;
              }
            : onChanged!);
  }
}
