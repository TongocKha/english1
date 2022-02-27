import 'package:english1/myapp/bloc/languages/translate_constant.dart';
import 'package:english1/myapp/bloc/tts_input/text_to_speech_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextToSpeechSetting extends StatelessWidget {
  const TextToSpeechSetting({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechInputBloc, TextToSpeechInputState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          height: height / 3,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Text To Speech',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Slider(
                  value: state.volume,
                  onChanged: (newVolume) {
                    context
                        .read<TextToSpeechInputBloc>()
                        .add(TextToSpeechChangeVolumeInput(volume: newVolume));
                  },
                  min: 0.0,
                  max: 1.0,
                  divisions: 10,
                  label: "Volume: ${state.volume}"),
              Slider(
                value: state.pitch,
                onChanged: (newPitch) {
                  context
                      .read<TextToSpeechInputBloc>()
                      .add(TextToSpeechChangePitchInput(pitch: newPitch));
                },
                min: 0.5,
                max: 2.0,
                divisions: 15,
                label: "Pitch: ",
                activeColor: Colors.red,
              ),
              Slider(
                value: state.rate,
                onChanged: (newRate) {
                  context
                      .read<TextToSpeechInputBloc>()
                      .add(TextToSpeechChangeRateInput(rate: newRate));
                },
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: "Rate: ",
                activeColor: Colors.green,
              )
            ],
          ),
        );
      },
    );
  }
}
