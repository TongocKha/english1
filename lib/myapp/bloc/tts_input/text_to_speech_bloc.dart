import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../languages/tts_input_language.dart';

part 'text_to_speech_event.dart';
part 'text_to_speech_state.dart';

class TextToSpeechInputBloc
    extends Bloc<TextToSpeechEventInput, TextToSpeechInputState> {
  final FlutterTts flutterTts = FlutterTts();

  TextToSpeechInputBloc() : super(const TextToSpeechInputState()) {
    on<TextToSpeechinitInput>(_onTtsInputinit);
    on<TextToSpeechNewTextInput>(_onTtsInputSpeechNewText);
    on<TextToSpeechPlayInput>(_onTtsPlayInput);
    on<TextToSpeechStopInput>(_onTtsInputStop);
    on<TextToSpeechChangeVolumeInput>(_onTtsInputChangeVolume);
    on<TextToSpeechChangePitchInput>(_onTtsInputChangePitch);
    on<TextToSpeechChangeRateInput>(_onTtsInputChangeRate);
    on<TextToSpeechChangeLanguageInput>(_onTtsInputChangeLanguage);
  }
  Future<void> _onTtsInputinit(
      TextToSpeechinitInput event, Emitter<TextToSpeechInputState> emit) async {
    emit(state.copyWith(
        voice: TextToSpeechInputConstants.languageInput[0],
        volume: 1.0,
        pitch: 1.0,
        rate: 0.5,
        ttsState: TtsInputState.stop));
  }

  _onTtsInputSpeechNewText(
      TextToSpeechNewTextInput event, Emitter<TextToSpeechInputState> emit) {
    emit(state.copyWith(
        newVoiceText: event.textToSpeechText, ttsState: TtsInputState.stop));
  }

  _onTtsPlayInput(TextToSpeechPlayInput event,
      Emitter<TextToSpeechInputState> emitter) async {
    await flutterTts.setVolume(state.volume);
    await flutterTts.setSpeechRate(state.rate);
    await flutterTts.setPitch(state.pitch);
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
        [IosTextToSpeechAudioCategoryOptions.defaultToSpeaker]);
    await flutterTts.setLanguage(event.voice);
    if (event.textToSpeechText != '' && event.textToSpeechText.isNotEmpty) {
      emitter(state.copyWith(
          ttsState: TtsInputState.play, newVoiceText: event.textToSpeechText));
      await flutterTts.speak(event.textToSpeechText);
    }
    flutterTts.setCompletionHandler(() {
      add(TextToSpeechStopInput());
    });
  }

  _onTtsInputStop(
      TextToSpeechStopInput event, Emitter<TextToSpeechInputState> emit) async {
    await flutterTts.stop();
    emit(state.copyWith(ttsState: TtsInputState.stop));
  }

  _onTtsInputChangeVolume(TextToSpeechChangeVolumeInput event,
      Emitter<TextToSpeechInputState> emit) {
    emit(state.copyWith(volume: event.volume));
  }

  _onTtsInputChangePitch(TextToSpeechChangePitchInput event,
      Emitter<TextToSpeechInputState> emit) {
    emit(state.copyWith(pitch: event.pitch));
  }

  _onTtsInputChangeRate(
      TextToSpeechChangeRateInput event, Emitter<TextToSpeechInputState> emit) {
    emit(state.copyWith(rate: event.rate));
  }

  _onTtsInputChangeLanguage(TextToSpeechChangeLanguageInput event,
      Emitter<TextToSpeechInputState> emit) {
    emit(state.copyWith(voice: event.language));
  }
}
