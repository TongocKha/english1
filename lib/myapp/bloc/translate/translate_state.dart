part of 'translate_bloc.dart';

class TranslateState extends Equatable {
  final String input;
  final String result;
  final String languageResult;
  final String languageInput;

  const TranslateState({
    this.input = '',
    this.result = '',
    this.languageResult = '',
    this.languageInput = '',
  });

  @override
  List<Object> get props => [
        input,
        result,
        languageInput,
        languageResult,
      ];

  TranslateState copyWith({
    String? input,
    String? result,
    String? languageResult,
    String? languageInput,
    List<String>? listLanguage,
  }) {
    return TranslateState(
      input: input ?? this.input,
      result: result ?? this.result,
      languageResult: languageResult ?? this.languageResult,
      languageInput: languageInput ?? this.languageInput,
    );
  }
}
