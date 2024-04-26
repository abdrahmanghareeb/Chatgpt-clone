import 'package:chatgpt_clone/Constants/dummy.dart';
import 'package:chatgpt_clone/Services/AssetsManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Constants/colors.dart';

Widget TextWidget(String text){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      "$text",
      style: TextStyle(color: textColor , fontSize: 18),
    ),
  );
}