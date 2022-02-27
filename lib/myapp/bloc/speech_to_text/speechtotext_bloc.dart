import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../languages/speech_to_text_constants.dart';

part 'speechtotext_event.dart';
part 'speechtotext_state.dart';

class SpeechtotextBloc extends Bloc<SpeechtotextEvent, SpeechtotextState> {
  final SpeechToText speech = SpeechToText();

  SpeechtotextBloc() : super(const SpeechtotextState()) {
    on<SpeechStart>(_onStarted);
    on<SpeechListenDuration>(_onChangeListenDuration);
    on<SpeechPauseDuration>(_onChangePauseDuration);
    on<SpeechStop>(_onStop);
    on<SpeechCancel>(_onCancel);
    on<SpeechListen>(_onListen);
    on<SpeechNewWord>(_onNewWord);
    on<SpeechChange>(_onChange);
    on<SpeechChangeLanguage>(_onChangLanguages);
  }
  _onStarted(SpeechStart event, Emitter<SpeechtotextState> emit) async {
    emit(state.copyWith(
      listenDuration: 40,
      pauseDuration: 2,
      recognizedWords: '',
      isListen: false,
      currentLocaleId: 'vi-VN',
    ));
  }

  _onChangLanguages(
      SpeechChangeLanguage event, Emitter<SpeechtotextState> emit) {
    emit(state.copyWith(currentLocaleId: event.currentId, isListen: false));
  }

  _onChangeListenDuration(
      SpeechListenDuration event, Emitter<SpeechtotextState> emit) {
    emit(state.copyWith(listenDuration: event.listenDuration));
  }

  _onChangePauseDuration(
      SpeechPauseDuration event, Emitter<SpeechtotextState> emit) {
    emit(state.copyWith(pauseDuration: event.pauseDuration));
  }

  _onNewWord(SpeechNewWord evnet, Emitter<SpeechtotextState> emit) {
    emit(state.copyWith(recognizedWords: evnet.currentText, isListen: false));
    if (evnet.currentText == '' && evnet.currentText.isNotEmpty) {
      emit(state.copyWith(recognizedWords: ''));
    }
  }

  _onChange(SpeechChange evnet, Emitter<SpeechtotextState> emit) {
    emit(state.copyWith(isListen: false));
  }

  _onListen(SpeechListen event, Emitter<SpeechtotextState> emit) async {
    emit(
        state.copyWith(isListen: true, recognizedWords: state.recognizedWords));
    bool availabe = await speech.initialize(
      onError: (e) {
        add(SpeechCancel());
      },
      onStatus: (status) {
        if (status == 'done') {
          add(SpeechChange());
        }
      },
    );
    if (availabe == true) {
      try {
        emit(state.copyWith(isListen: true));
        speech.listen(
            cancelOnError: true,
            listenFor: Duration(seconds: state.listenDuration.toInt()),
            pauseFor: Duration(seconds: state.pauseDuration.toInt()),
            localeId: state.currentLocaleId,
            onResult: (result) {
              add(SpeechNewWord(currentText: result.recognizedWords));
            });
      } catch (_) {
        add(SpeechCancel());
      }
    } else {
      add(SpeechCancel());
    }
  }

  _onStop(SpeechStop event, Emitter<SpeechtotextState> emit) async {
    emit(state.copyWith(isListen: false));
    await speech.stop();
  }

  _onCancel(SpeechCancel evnet, Emitter<SpeechtotextState> emit) async {
    emit(state.copyWith(isListen: false, recognizedWords: ''));
    await speech.cancel();
  }
}
