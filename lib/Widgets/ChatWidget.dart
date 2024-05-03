import 'package:chatgpt_clone/Constants/constants.dart';
import 'package:chatgpt_clone/Constants/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'TextWidget.dart';

Widget ChatWidget({@required text ,likeFunction,  unlikeFunction  ,@required index , @required imageAsset , @required color ,@required isResponse}){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: color),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(height : 40 , width: 40 ,child: Image.asset(imageAsset)),
        ),
        SizedBox(width: 10,),
        Expanded(child: TextWidget("${text}")),

      ],
    ),
  );
}