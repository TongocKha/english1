import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:equatable/equatable.dart';
import 'package:translator/translator.dart';
import '../languages/translate_constant.dart';

part 'translate_event.dart';
part 'translate_state.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

const debounceDuration = Duration(milliseconds: 100);

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  final GoogleTranslator translator = GoogleTranslator();
  TranslateBloc() : super(const TranslateState()) {
    on<TranslateInit>(_onTranslateInit);
    on<TranslateInput>(_onTranslateInput,
        transformer: debounce(debounceDuration));
    on<TranslateResult>(_onTranslateResult);
    on<TranslateChangeLanguageInput>(_onTranslateChangeLanguageInput);
    on<TranslateChangeLanguageResult>(_onTranslateChangeLanguageResult);
    on<TranslateSwapButton>(_onTranslateSwapButton,
        transformer: debounce(Duration(milliseconds: 300)));
  }
  _onTranslateInit(TranslateInit event, Emitter<TranslateState> emit) {
    emit(state.copyWith(
      input: '',
      result: '',
      languageInput: LanguageList.language[98],
      languageResult: LanguageList.language[21],
    ));
  }

  _onTranslateInput(TranslateInput event, Emitter<TranslateState> emit) {
    emit(state.copyWith(input: event.input));
    if (event.input != '' && event.input.isNotEmpty) {
      translator
          .translate(event.input,
              to: state.languageResult, from: state.languageInput)
          .then((value) => {add(TranslateResult(result: value.text))});
    } else {
      add(const TranslateResult(result: ''));
    }
  }

  _onTranslateResult(TranslateResult event, Emitter<TranslateState> emit) {
    emit(state.copyWith(result: event.result));
  }

  _onTranslateChangeLanguageInput(
      TranslateChangeLanguageInput event, Emitter<TranslateState> emit) {
    emit(state.copyWith(languageInput: event.languageInput));
  }

  _onTranslateChangeLanguageResult(
      TranslateChangeLanguageResult event, Emitter<TranslateState> emit) {
    emit(state.copyWith(languageResult: event.languageResult));
  }

  _onTranslateSwapButton(
      TranslateSwapButton event, Emitter<TranslateState> emit) {
    emit(state.copyWith(
        input: state.result,
        languageInput: state.languageResult,
        languageResult: state.languageInput));
  }
}
