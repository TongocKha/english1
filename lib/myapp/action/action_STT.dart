import 'package:english1/myapp/bloc/speech_to_text/speechtotext_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionStt extends StatefulWidget {
  const ActionStt({Key? key}) : super(key: key);

  @override
  _ActionSttState createState() => _ActionSttState();
}

class _ActionSttState extends State<ActionStt> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechtotextBloc, SpeechtotextState>(
      builder: ((context, state) {
        return IconButton(
          onPressed: () {
            state.isListen
                ? context.read<SpeechtotextBloc>().add(SpeechCancel())
                : context.read<SpeechtotextBloc>().add(SpeechListen());
          },
          icon: Icon(state.isListen ? Icons.mic_none_outlined : Icons.mic),
        );
      }),
    );
  }
}
