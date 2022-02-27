import 'package:english1/app/bloc/app_bloc.dart';
import 'package:english1/myapp/myapp.dart';
import 'package:flutter/widgets.dart';

import '../../login/view/login_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [MyApp.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
