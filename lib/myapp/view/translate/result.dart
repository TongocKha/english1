import 'package:english1/myapp/action/action_TTS.dart';
import 'package:english1/myapp/bloc/languages/translate_constant.dart';
import 'package:english1/myapp/bloc/translate/translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/speech_to_text/speechtotext_bloc.dart';

class ResultField extends StatefulWidget {
  const ResultField({Key? key, required this.height, required this.width})
      : super(key: key);
  final double width;
  final double height;
  @override
  _ResultFieldState createState() => _ResultFieldState();
}

class _ResultFieldState extends State<ResultField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // width: width,
      // height: height,
      child: Card(
          color: Colors.blue[300],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ActionTtsResultText(),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      LanguageList.mapLanguageCodeToName(
                          languageCode: context
                              .watch<TranslateBloc>()
                              .state
                              .languageResult),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon:
                            const Icon(Icons.star_border, color: Colors.white))
                  ],
                ),
              ),
              const ResultText(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.crop_free,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.upgrade_sharp,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.content_copy_rounded,
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          )),
    );
  }
}

class ResultText extends StatefulWidget {
  const ResultText({Key? key}) : super(key: key);

  @override
  _ResultTextState createState() => _ResultTextState();
}

class _ResultTextState extends State<ResultText> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        return Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
                top: 1.0, left: 25.0, right: 25.0, bottom: 10.0),
            child: Text(
              state.result,
              style: const TextStyle(fontSize: 20),
            ));
      },
    );
  }
}
