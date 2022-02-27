part of 'speechtotext_bloc.dart';

abstract class SpeechtotextEvent extends Equatable {
  const SpeechtotextEvent();

  @override
  List<Object> get props => [];
}

class SpeechListenDuration extends SpeechtotextEvent {
  final double listenDuration;
  const SpeechListenDuration({required this.listenDuration});
}

class SpeechPauseDuration extends SpeechtotextEvent {
  final double pauseDuration;
  const SpeechPauseDuration({required this.pauseDuration});
}

class SpeechNewWord extends SpeechtotextEvent {
  final String currentText;
  const SpeechNewWord({required this.currentText});
}

class SpeechChange extends SpeechtotextEvent {}

class SpeechListen extends SpeechtotextEvent {}

class SpeechStart extends SpeechtotextEvent {}

class SpeechStop extends SpeechtotextEvent {}

class SpeechCancel extends SpeechtotextEvent {}

class SpeechChangeLanguage extends SpeechtotextEvent {
  final String currentId;
  const SpeechChangeLanguage({required this.currentId});
}
