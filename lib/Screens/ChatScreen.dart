import 'package:chatgpt_clone/Constants/colors.dart';
import 'package:chatgpt_clone/Constants/dummy.dart';
import 'package:chatgpt_clone/Services/API_Service.dart';
import 'package:chatgpt_clone/Services/AssetsManager.dart';
import 'package:chatgpt_clone/Services/DropDownService.dart';
import 'package:chatgpt_clone/Widgets/ChatWidget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart';

import '../Provider/chat_cubit.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ChatCubit cubit = ChatCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(AssetsManager.openai_logo),
                ),
                title: Text(
                  "Chatgpt",
                  style: TextStyle(color: textColor),
                ),
                actions: [
                  IconButton(
                      onPressed: () async {
                        await DropDownService.DropDown(context: context);
                        cubit.DropDownChange();
                      },
                      icon: Icon(CupertinoIcons.ellipsis_vertical,
                          color: textColor))
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                        child: ConditionalBuilder(
                      condition: ChatCubit.responseStatusCode == 200,
                      fallback: (context) => Text("let me help"),
                      builder: (context) => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (cubit.response["candidates"][0]["index"] == 0) {
                            return Column(
                              children: [
                                ChatWidget(
                                    text: cubit.sentPrompets[index],
                                    index: index,
                                    imageAsset: AssetsManager.person,
                                    color: appThemeColor,
                                    isResponse: false),
                                ChatWidget(
                                    text: cubit.responseMessages[index],
                                    index: index,
                                    imageAsset: AssetsManager.chat_logo,
                                    color: textFieldColor,
                                    isResponse: true),
                              ],
                            );
                          }
                        },
                        itemCount:  cubit.responseMessages.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 6,
                        ),
                      ),
                    )),
                    //seperator
                    Container(
                      height: 3,
                      decoration: BoxDecoration(color: appThemeColor),
                    ),
                    if (cubit.changeText.isNotEmpty) ...[
                      const SpinKitThreeBounce(
                        color: Colors.white70,
                        size: 18,
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                    Container(
                      color: textFieldColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                            controller: cubit.textEditingController,
                            style: TextStyle(color: textColor),
                            onChanged: (value) {
                              cubit.changeText = value;
                              cubit.OnWritingChange();
                            },
                            decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                hintText: "How can i help?",
                                hintStyle: TextStyle(color: textColor),
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.send, color: textColor),
                                    onPressed: () {
                                      cubit.sentPrompets.add(cubit.textEditingController.text);
                                      cubit.OnSendStateChange();
                                    }))),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
