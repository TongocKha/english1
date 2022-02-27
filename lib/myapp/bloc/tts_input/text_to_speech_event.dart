part of 'text_to_speech_bloc.dart';

class TextToSpeechEventInput extends Equatable {
  const TextToSpeechEventInput();

  @override
  List<Object> get props => [];
}

class TextToSpeechChangeVolumeInput extends TextToSpeechEventInput {
  final double volume;
  const TextToSpeechChangeVolumeInput({required this.volume});
}

class TextToSpeechChangePitchInput extends TextToSpeechEventInput {
  final double pitch;
  const TextToSpeechChangePitchInput({required this.pitch});
}

class TextToSpeechChangeRateInput extends TextToSpeechEventInput {
  final double rate;
  const TextToSpeechChangeRateInput({required this.rate});
}

class TextToSpeechChangeLanguageInput extends TextToSpeechEventInput {
  final String language;
  const TextToSpeechChangeLanguageInput({required this.language});
}

class TextToSpeechNewTextInput extends TextToSpeechEventInput {
  final String textToSpeechText;
  const TextToSpeechNewTextInput({required this.textToSpeechText});
}

class TextToSpeechinitInput extends TextToSpeechEventInput {}

class TextToSpeechPlayInput extends TextToSpeechEventInput {
  final String voice;
  final String textToSpeechText;
  const TextToSpeechPlayInput(
      {required this.textToSpeechText, required this.voice});
}

class TextToSpeechStopInput extends TextToSpeechEventInput {}
