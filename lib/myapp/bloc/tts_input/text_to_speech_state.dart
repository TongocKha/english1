part of 'text_to_speech_bloc.dart';

enum TtsInputState { play, stop }

class TextToSpeechInputState extends Equatable {
  final String voice;
  final double volume;
  final double pitch;
  final double rate;
  final String newVoiceText;
  final TtsInputState ttsState;

  const TextToSpeechInputState(
      {this.voice = '',
      this.volume = 0.5,
      this.pitch = 1.0,
      this.rate = 0.5,
      this.newVoiceText = '',
      this.ttsState = TtsInputState.stop});

  @override
  List<Object> get props =>
      [voice, volume, pitch, rate, newVoiceText, ttsState];

  TextToSpeechInputState copyWith(
      {String? voice,
      double? volume,
      double? pitch,
      double? rate,
      String? newVoiceText,
      TtsInputState? ttsState}) {
    return TextToSpeechInputState(
        voice: voice ?? this.voice,
        volume: volume ?? this.volume,
        pitch: pitch ?? this.pitch,
        rate: rate ?? this.rate,
        newVoiceText: newVoiceText ?? this.newVoiceText,
        ttsState: ttsState ?? this.ttsState);
  }
}
