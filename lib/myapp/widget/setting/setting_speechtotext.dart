import 'package:english1/myapp/bloc/languages/translate_constant.dart';
import 'package:english1/myapp/bloc/speech_to_text/speechtotext_bloc.dart';
import 'package:english1/myapp/widget/masterButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingSpeechToText extends StatelessWidget {
  const SettingSpeechToText({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechtotextBloc, SpeechtotextState>(
        builder: (context, state) {
      final List<ListTile> list = LanguageList.language.map(
        (e) {
          return ListTile(
            title: Text(LanguageList.mapLanguageCodeToName(languageCode: e)),
            onTap: () {
              context
                  .read<SpeechtotextBloc>()
                  .add(SpeechChangeLanguage(currentId: e));

              Navigator.pop(context);
            },
          );
        },
      ).toList();
      return Container(
        padding: const EdgeInsets.all(8),
        height: height / 3,
        width: width,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Speech To Text',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        // context
                        //     .read<SpeechToTextBloc>()
                        //     .add(SpeechToTextInitData());
                      },
                      icon: const Icon(Icons.autorenew)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MasterButton(
                              list: list,
                              menuTitle: "Current Locales",
                            )));
              },
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      LanguageList.mapLanguageCodeToName(
                          languageCode: state.currentLocaleId),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
            ),
            Slider(
              value: state.listenDuration,
              onChanged: (listenDuration) {
                context
                    .read<SpeechtotextBloc>()
                    .add(SpeechListenDuration(listenDuration: listenDuration));
              },
              max: 40,
              min: 5,
              divisions: 5,
              label: 'ListenDuration ${state.listenDuration}',
            ),
            Slider(
              value: state.pauseDuration.toDouble(),
              onChanged: (newPauseDuration) {
                context
                    .read<SpeechtotextBloc>()
                    .add(SpeechPauseDuration(pauseDuration: newPauseDuration));
              },
              min: 0,
              max: 5,
              divisions: 5,
              label: "Pause Duration: ${state.pauseDuration}",
              activeColor: Colors.red,
            ),
          ],
        ),
      );
    });
  }
}
