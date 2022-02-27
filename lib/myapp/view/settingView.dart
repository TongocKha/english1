import 'package:english1/myapp/widget/setting/setting_speechtotext.dart';
import 'package:english1/myapp/widget/setting/setting_texttospeech.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  final double width;
  final double height;
  const SettingView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Container(
        //   color: Colors.blue,
        //   height: AppBar().preferredSize.height,
        //   child: const Center(
        //       child: Text(
        //     'Setting',
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   )),
        // ),
        const SizedBox(
          height: 15,
        ),
        TextToSpeechSetting(
          height: height,
          width: width,
        ),
        const SizedBox(
          height: 15,
        ),
        SettingSpeechToText(
          height: height,
          width: width,
        )
      ],
    );
  }
}
