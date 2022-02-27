import 'package:english1/myapp/bloc/speech_to_text/speechtotext_bloc.dart';
import 'package:english1/myapp/bloc/translate/translate_bloc.dart';
import 'package:english1/myapp/bloc/tts_input/text_to_speech_bloc.dart';
import 'package:english1/myapp/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: MyApp());

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        home: Multiprovider());
  }
}

class Multiprovider extends StatefulWidget {
  const Multiprovider({Key? key}) : super(key: key);

  @override
  _MultiproviderState createState() => _MultiproviderState();
}

class _MultiproviderState extends State<Multiprovider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TranslateBloc>(create: (_) => TranslateBloc()),
      BlocProvider<TextToSpeechInputBloc>(
          create: (_) => TextToSpeechInputBloc()),
      BlocProvider<SpeechtotextBloc>(create: (_) => SpeechtotextBloc()),
    ], child: const HomePage());
  }
}
