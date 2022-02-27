import 'package:english1/myapp/bloc/translate/translate_bloc.dart';
import 'package:english1/myapp/bloc/tts_input/text_to_speech_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionTtsInputText extends StatelessWidget {
  const ActionTtsInputText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechInputBloc, TextToSpeechInputState>(
        builder: (context, state) {
      return Column(
        children: [
          IconButton(
              icon: Icon(
                  context.watch<TextToSpeechInputBloc>().state.ttsState ==
                          TtsInputState.stop
                      ? Icons.volume_up
                      : Icons.volume_mute),
              splashColor: const Color.fromARGB(255, 9, 36, 23),
              onPressed: () {
                context.read<TextToSpeechInputBloc>().state.ttsState ==
                        TtsInputState.stop
                    ? context
                        .read<TextToSpeechInputBloc>()
                        .add(TextToSpeechPlayInput(
                          voice:
                              context.read<TranslateBloc>().state.languageInput,
                          textToSpeechText:
                              context.read<TranslateBloc>().state.input,
                        ))
                    : context
                        .read<TextToSpeechInputBloc>()
                        .add(TextToSpeechStopInput());
              }),
        ],
      );
    });
  }
}

class ActionTtsResultText extends StatelessWidget {
  const ActionTtsResultText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechInputBloc, TextToSpeechInputState>(
        builder: (context, state) {
      return Column(
        children: [
          IconButton(
              icon: Icon(
                context.watch<TextToSpeechInputBloc>().state.ttsState ==
                        TtsInputState.stop
                    ? Icons.volume_up
                    : Icons.volume_mute,
                color: Colors.white,
              ),
              splashColor: const Color.fromARGB(255, 9, 36, 23),
              onPressed: () {
                context.read<TextToSpeechInputBloc>().state.ttsState ==
                        TtsInputState.stop
                    ? context
                        .read<TextToSpeechInputBloc>()
                        .add(TextToSpeechPlayInput(
                          voice: context
                              .read<TranslateBloc>()
                              .state
                              .languageResult,
                          textToSpeechText:
                              context.read<TranslateBloc>().state.result,
                        ))
                    : context
                        .read<TextToSpeechInputBloc>()
                        .add(TextToSpeechStopInput());
              }),
        ],
      );
    });
  }
}
