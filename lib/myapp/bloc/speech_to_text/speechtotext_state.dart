part of 'speechtotext_bloc.dart';

enum SpeechStatus { playing, unkown }

class SpeechtotextState extends Equatable {
  final double listenDuration;
  final double pauseDuration;
  final bool isListen;
  final SpeechStatus status;
  final String currentLocaleId;
  final String recognizedWords;

  const SpeechtotextState({
    this.listenDuration = 40,
    this.pauseDuration = 3,
    this.isListen = false,
    this.status = SpeechStatus.unkown,
    this.currentLocaleId = '',
    this.recognizedWords = '',
  });

  @override
  List<Object> get props {
    return [
      listenDuration,
      pauseDuration,
      isListen,
      status,
      recognizedWords,
      currentLocaleId,
    ];
  }

  SpeechtotextState copyWith({
    double? listenDuration,
    double? pauseDuration,
    bool? isListen,
    SpeechStatus? status,
    String? currentLocaleId,
    String? recognizedWords,
  }) {
    return SpeechtotextState(
      listenDuration: listenDuration ?? this.listenDuration,
      pauseDuration: pauseDuration ?? this.pauseDuration,
      isListen: isListen ?? this.isListen,
      status: status ?? this.status,
      currentLocaleId: currentLocaleId ?? this.currentLocaleId,
      recognizedWords: recognizedWords ?? this.recognizedWords,
    );
  }
}
