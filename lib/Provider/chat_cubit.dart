import 'package:bloc/bloc.dart';
import 'package:chatgpt_clone/Services/API_Service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {

  var response;
  static var responseStatusCode;
  String changeText = "";
  var  textEditingController = TextEditingController();
  // List<Map<String , dynamic>> r;
   List<String> sentPrompets = [];
   List<String> responseMessages = [];


  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  void getResponseCubit(){
    Api_Service.getResponse(prompet: textEditingController.text).then((value){
      emit(GetResponseSuccessfully());
      response = value;
      responseMessages.add(response["candidates"][0]["content"]['parts'][0]["text"]);
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ErrorGetingResponse());
    });
  }
  void OnSendStateChange(){
    getResponseCubit();
    emit(OnSendState());
    //reset the text Editing controller
    textEditingController.text = "";
  }
  void DropDownChange(){
    emit(DropDownState());
  }
  void OnWritingChange(){
    emit(OnWritingState());
  }

}
