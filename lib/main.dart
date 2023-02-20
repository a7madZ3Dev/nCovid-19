import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '/core/utils/colors.dart';
import '/providers/data.dart';
import '/screens/home.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.leanBack,
  // );

  runApp(Covid());
}

class Covid extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<Data>(
        create: (context) => Data(),
        child: DynamicTheme(
          themeCollection: themeCollection,
          builder: (context, theme) => GetMaterialApp(
            title: 'Covid App',
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: const Home(),
          ),
        ),
      );
}
