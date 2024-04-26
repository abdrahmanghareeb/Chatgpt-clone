import 'package:chatgpt_clone/Constants/colors.dart';
import 'package:chatgpt_clone/Constants/dummy.dart';
import 'package:chatgpt_clone/Services/AssetsManager.dart';
import 'package:chatgpt_clone/Services/DropDownService.dart';
import 'package:chatgpt_clone/Widgets/ChatWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String onChange = "";

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(AssetsManager.openai_logo),
          ),
          title: Text("Chatgpt", style: TextStyle(color: textColor),
          ),
          actions: [
            IconButton(
                onPressed: () async{
                  await DropDownService.DropDown(context: context);
                },
                icon: Icon(CupertinoIcons.ellipsis_vertical , color: textColor))],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if(chatMessages[index]["chatIndex"] == 1) {
                   return ChatWidget(
                   //     likeFunction:() {
                   //   isLikedPressed = !isLikedPressed;
                   //   },
                   //     unlikeFunction: (){
                   //       isUnLikedPressed = !isUnLikedPressed;
                   // },
                       index: index, imageAsset: AssetsManager.chat_logo, color: textFieldColor , isResponse :true);
                  }
                  else{
                   return ChatWidget(index: index, imageAsset: AssetsManager.person, color: appThemeColor, isResponse :false);}
                },
                itemCount: chatMessages.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 6,),
              )),
              //seperator
              Container(height: 3, decoration: BoxDecoration(color: appThemeColor),),
              if (onChange.isNotEmpty) ...[
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
                    controller: textEditingController,
                    style: TextStyle(color: textColor),
                    onChanged: (value) {
                      onChange = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        hintText: "How can i help?",
                        hintStyle: TextStyle(color: textColor),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: textColor),
                          onPressed: () {},
                        )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
