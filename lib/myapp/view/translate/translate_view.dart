import 'package:english1/myapp/view/translate/languageField.dart';
import 'package:english1/myapp/view/translate/result.dart';
import 'package:flutter/material.dart';
import 'input.dart';

class TranslateView extends StatefulWidget {
  const TranslateView({Key? key}) : super(key: key);

  @override
  _TranslateViewState createState() => _TranslateViewState();
}

class _TranslateViewState extends State<TranslateView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = AppBar().preferredSize.height;
    final width = size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LanguageField(width: width, height: height),
          const Divider(),
          InputField(width: width, height: height),
          const SizedBox(height: 2),
          ResultField(width: width, height: height)
        ],
      ),
    );
  }
}
