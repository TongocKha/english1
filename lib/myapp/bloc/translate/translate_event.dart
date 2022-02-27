part of 'translate_bloc.dart';

class TranslateEvent extends Equatable {
  const TranslateEvent();

  @override
  List<Object> get props => [];
}

class TranslateInit extends TranslateEvent {}

class TranslateInput extends TranslateEvent {
  final String input;
  const TranslateInput({required this.input});
}

class TranslateResult extends TranslateEvent {
  final String result;
  const TranslateResult({required this.result});
}

class TranslateChangeLanguageInput extends TranslateEvent {
  final String languageInput;
  const TranslateChangeLanguageInput({required this.languageInput});
}

class TranslateChangeLanguageResult extends TranslateEvent {
  final String languageResult;
  const TranslateChangeLanguageResult({required this.languageResult});
}

class TranslateSwapButton extends TranslateEvent {}
