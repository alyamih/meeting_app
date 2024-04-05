import 'package:flutter/material.dart';
import 'package:meeting_app/pages/greeting_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).currentTheme ==
              ThemeClass.lightTheme
          ? const Color(0xFFEBF5ED)
          : const Color(0xFF1E2321),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
            child: Image.asset('assets/onBoarding.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Welcome to our app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color:
                            Provider.of<ThemeProvider>(context).currentTheme ==
                                    ThemeClass.lightTheme
                                ? Colors.black
                                : Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Schedule your appointments and keep track of their urgency',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color:
                            Provider.of<ThemeProvider>(context).currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFF1E2321).withOpacity(0.7)
                                : const Color(0xFFEBF5ED).withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const GreetingPage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? const Color(0xFF50D175)
                        : const Color(0xFF5EC286),
                    borderRadius: BorderRadius.circular(4)),
                child: const Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
