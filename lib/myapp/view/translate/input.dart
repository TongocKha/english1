import 'package:english1/myapp/action/action_STT.dart';
import 'package:english1/myapp/action/action_TTS.dart';
import 'package:english1/myapp/action/clearButton.dart';
import 'package:english1/myapp/bloc/languages/translate_constant.dart';
import 'package:english1/myapp/bloc/speech_to_text/speechtotext_bloc.dart';
import 'package:english1/myapp/bloc/translate/translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // width: width,
      // height: height,
      child: Card(
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ActionTtsInputText(),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      LanguageList.mapLanguageCodeToName(
                          languageCode: context
                              .watch<TranslateBloc>()
                              .state
                              .languageInput),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const InputText(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                    const ActionStt(),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('abcdze');
    TextEditingController controller = TextEditingController();

    context.read<TranslateBloc>().add(TranslateInput(
        input: controller.text =
            context.watch<SpeechtotextBloc>().state.recognizedWords));
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(
          top: 1.0, left: 25.0, right: 25.0, bottom: 10.0),
      child: TextField(
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: context.read<TranslateBloc>().state.input != '' &&
                    context.read<TranslateBloc>().state.input.isNotEmpty
                ? null
                : ClearButton(onPress: () {
                    context
                        .read<TranslateBloc>()
                        .add(const TranslateInput(input: ''));
                    controller.text = '';
                  })),
        minLines: 1,
        maxLines: 3,
        controller: controller,
        onChanged: (value) {
          context.read<TranslateBloc>().add(TranslateInput(input: value));
        },
      ),
    );
  }
}
