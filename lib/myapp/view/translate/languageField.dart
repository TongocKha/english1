import 'package:english1/myapp/bloc/languages/translate_constant.dart';
import 'package:english1/myapp/bloc/speech_to_text/speechtotext_bloc.dart';
import 'package:english1/myapp/bloc/translate/translate_bloc.dart';
import 'package:english1/myapp/widget/masterButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const textStyle = TextStyle(color: Colors.black, fontSize: 16);

class LanguageField extends StatelessWidget {
  const LanguageField({Key? key, required this.height, required this.width})
      : super(key: key);
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 40),
      height: height,
      child: Row(
        children: const [
          SourceLanguageBox(),
          Spacer(),
          SwapLanguagesButton(),
          Spacer(),
          TagertLanguageBox(),
        ],
      ),
    );
  }
}

class SourceLanguageBox extends StatelessWidget {
  const SourceLanguageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListTile> list = LanguageList.language.map(
      (e) {
        return ListTile(
          title: Text(LanguageList.mapLanguageCodeToName(languageCode: e)),
          onTap: () {
            context
                .read<TranslateBloc>()
                .add(TranslateChangeLanguageInput(languageInput: e));
            context
                .read<SpeechtotextBloc>()
                .add(SpeechChangeLanguage(currentId: e));
            Navigator.pop(context);
          },
        );
      },
    ).toList();
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MasterButton(
                      list: list,
                      menuTitle: 'Language Input',
                    )));
      },
      child: Text(
        LanguageList.mapLanguageCodeToName(
            languageCode: context.watch<TranslateBloc>().state.languageInput),
        style: textStyle,
      ),
    );
  }
}

class SwapLanguagesButton extends StatelessWidget {
  const SwapLanguagesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        context.read<TranslateBloc>().add(TranslateSwapButton());
        context.read<SpeechtotextBloc>().add(SpeechNewWord(
            currentText: context.read<TranslateBloc>().state.result));
        context.read<SpeechtotextBloc>().add(SpeechChangeLanguage(
            currentId: context.read<TranslateBloc>().state.languageResult));
      },
      icon: const Icon(Icons.swap_horiz),
    );
  }
}

class TagertLanguageBox extends StatelessWidget {
  const TagertLanguageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListTile> list = LanguageList.language.map(
      (e) {
        return ListTile(
          title: Text(LanguageList.mapLanguageCodeToName(languageCode: e)),
          onTap: () {
            context
                .read<TranslateBloc>()
                .add(TranslateChangeLanguageResult(languageResult: e));
            context.read<TranslateBloc>().add(TranslateInput(
                input: context.read<TranslateBloc>().state.input));

            Navigator.pop(context);
          },
        );
      },
    ).toList();
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MasterButton(
                      list: list,
                      menuTitle: 'Language Result',
                    )));
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) => MasterButton(list: list));
      },
      child: Text(
        LanguageList.mapLanguageCodeToName(
            languageCode: context.watch<TranslateBloc>().state.languageResult),
        style: textStyle,
      ),
    );
  }
}
