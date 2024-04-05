import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/pages/splash_page.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(ChangeNotifierProvider(
      create: (context) => DarkMode(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dark Mode',
          theme: Provider.of<ThemeProvider>(context).currentTheme,
          home: const SplashPage(),
        );
      }),
    );
  }
}

class DarkMode with ChangeNotifier {
  bool darkMode = true;

  changemode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
