import 'package:english1/myapp/bloc/speech_to_text/speechtotext_bloc.dart';
import 'package:english1/myapp/bloc/translate/translate_bloc.dart';
import 'package:english1/myapp/bloc/tts_input/text_to_speech_bloc.dart';
import 'package:english1/myapp/view/features_setting_drawer.dart';
import 'package:english1/myapp/view/settingView.dart';
import 'package:english1/myapp/view/translate/translate_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  String mapIndexTitle({required int index}) {
    Map<int, String> map = {
      0: "Google Translate",
      1: "Saved Cards",
      2: "Self Learning",
      3: "Settings"
    };
    return map[index] ?? "";
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    print(auth.currentUser!.uid);
    context.read<TranslateBloc>().add(TranslateInit());
    context.read<SpeechtotextBloc>().add(SpeechStart());
    context.read<TextToSpeechInputBloc>().add(TextToSpeechinitInput());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double scafoldHeight = size.height;
    final double scafoldWidth = size.width;
    Widget child;
    switch (selectIndex) {
      case 0:
        child = const TranslateView();
        break;
      case 1:
        child = Container();
        break;
      case 2:
        child = Container();
        break;
      case 3:
        child = SettingView(
          height: scafoldHeight,
          width: scafoldWidth,
        );
        break;
      default:
        child = const CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(mapIndexTitle(index: selectIndex)),
      ),
      body: child,
      drawer: const FeaturesSettingDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: (value) => setState(() {
          selectIndex = value;
        }),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Learn"),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "Setting"),
        ],
      ),
    );
  }
}
