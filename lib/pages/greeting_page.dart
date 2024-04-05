import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/model/user.dart';
import 'package:meeting_app/pages/add_meeting_comment.dart';
import 'package:meeting_app/pages/home_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';

UserItem user = UserItem();

class GreetingPage extends StatefulWidget {
  const GreetingPage({super.key});

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  TextEditingController controller = TextEditingController();
  List<EMeetingCount> types = [
    EMeetingCount.fisrt,
    EMeetingCount.second,
    EMeetingCount.third
  ];
  EMeetingCount selected = EMeetingCount.fisrt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).currentTheme ==
              ThemeClass.lightTheme
          ? const Color(0xFFEBF5ED)
          : const Color(0xFF1E2321),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 65, 16, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Let\'s get acquainted',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Provider.of<ThemeProvider>(context)
                                          .currentTheme ==
                                      ThemeClass.lightTheme
                                  ? const Color(0xFF1E2321)
                                  : const Color(0xFFEBF5ED),
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'What is your name?',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Provider.of<ThemeProvider>(context)
                                        .currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFF1E2321).withOpacity(0.7)
                                : const Color(0xFFEBF5ED).withOpacity(0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: controller,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color:
                            Provider.of<ThemeProvider>(context).currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFF1E2321)
                                : const Color(0xFFEBF5ED),
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    decoration: InputDecoration(
                      // hintText: 'Your name',
                      // hintStyle: TextStyle(
                      //     fontFamily: 'SF Pro Text',
                      //     fontSize: 16,
                      //     color: const Color(0xFF1E2321).withOpacity(0.5)),
                      filled: true,
                      fillColor:
                          Provider.of<ThemeProvider>(context).currentTheme ==
                                  ThemeClass.lightTheme
                              ? const Color(0xFFC8ECD2)
                              : const Color(0xFF2E3B37),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (text) {
                      controller.text = text;
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'How many meetings do you have per month?',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Provider.of<ThemeProvider>(context)
                                          .currentTheme ==
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: getTypes(),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: InkWell(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  user.name = controller.text;
                  user.type = selected;
                  addToSP();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? controller.text.isNotEmpty
                            ? const Color(0xFF50D175)
                            : const Color(0xFF50D175).withOpacity(0.7)
                        : controller.text.isNotEmpty
                            ? const Color(0xFF5EC286)
                            : const Color(0xFF5EC286).withOpacity(0.7)),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: controller.text.isNotEmpty
                          ? Colors.white
                          : Colors.white.withOpacity(0.25),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getTypes() {
    List<Widget> list = [];
    for (var type in types) {
      list.add(InkWell(
        onTap: () {
          selected = type;
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Provider.of<ThemeProvider>(context).currentTheme ==
                      ThemeClass.lightTheme
                  ? selected == type
                      ? const Color(0xFF50D175)
                      : const Color(0xFFC8ECD2)
                  : selected == type
                      ? const Color(0xFF5EC286)
                      : const Color(0xFF2E3B37),
              border: Border.all(
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? selected == type
                          ? const Color(0xFF253126)
                          : Colors.transparent
                      : selected == type
                          ? const Color(0xFFEBF0EB)
                          : Colors.transparent,
                  width: 1),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type.text,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? const Color(0xFF1E2321)
                        : const Color(0xFFEBF5ED),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }
}
