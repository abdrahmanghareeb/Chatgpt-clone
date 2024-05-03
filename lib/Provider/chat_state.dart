part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
final class GetResponseSuccessfully extends ChatState {}
final class ErrorGetingResponse extends ChatState {}
final class OnSendState extends ChatState {}
final class OnWritingState extends ChatState {}
final class DropDownState extends ChatState {}
