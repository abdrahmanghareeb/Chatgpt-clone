import 'package:flutter/material.dart';

import '../Widgets/TextWidget.dart';

bool isLikedPressed = false;
bool isUnLikedPressed = false;

List<String> models = [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
  'Model5',
  'Model6',
];

List<DropdownMenuItem<String>>? get getModelsItem {
  List<DropdownMenuItem<String>>? modelsItems =
  List<DropdownMenuItem<String>>.generate(
      models.length,
          (index) => DropdownMenuItem(
          value: models[index],
          child: TextWidget(
            models[index],
          )));
  return modelsItems;
}