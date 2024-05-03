import 'package:chatgpt_clone/Constants/colors.dart';
import 'package:chatgpt_clone/Screens/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  // final model = GenerativeModel(model: 'gemini-pro', apiKey: "${dotenv.env['APIKEY']}");
  // final prompt = 'Write a story about a magic backpack.';
  // final content = [Content.text(prompt)];
  // final response = await model.generateContent(content);

  // print(response.text);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: appThemeColor,
          appBarTheme: AppBarTheme(color: textFieldColor),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChatScreen());
  }
}
