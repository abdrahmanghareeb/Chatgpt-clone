import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Constants/colors.dart';
import '../Widgets/ModelsDropDownWidget.dart';
import '../Widgets/TextWidget.dart';

class DropDownService{
  static Future DropDown({required BuildContext context}) async{
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (context) {
          return Container(height: 60, decoration: BoxDecoration(color: textFieldColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget("Choose model:"),
                SizedBox(width: 10,),
                Expanded(child: ModelsDrowDownWidget()),
              ],
            ),
          );
        });
  }
}