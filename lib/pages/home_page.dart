import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/model/meeting_item.dart';
import 'package:meeting_app/pages/add_meeting_comment.dart';
import 'package:meeting_app/pages/meeting_description_page.dart';
import 'package:meeting_app/pages/settings_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:meeting_app/widgets/bottom_bar.dart';
import 'package:meeting_app/widgets/meeting_widget.dart';
import 'package:provider/provider.dart';

MeetingItem currentMeeting = MeetingItem();
List<MeetingItem> meetings = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getSP(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).currentTheme ==
              ThemeClass.lightTheme
          ? const Color(0xFFEBF5ED)
          : const Color(0xFF1E2321),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const SettingsPage()),
                  );
                },
                child: Text(
                  'Settings',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? const Color(0xFF50D175)
                          : const Color(0xFF5EC286),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Row(
            children: [
              Text(
                'Main',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? Colors.black
                        : Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Expanded(
          child: meetings.isEmpty
              ? SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 16, right: 16),
                    child: Column(
                      children: [
                        Image.asset('assets/home_image.png'),
                        Text(
                          'There\'s no info',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Provider.of<ThemeProvider>(context)
                                          .currentTheme ==
                                      ThemeClass.lightTheme
                                  ? const Color(0xFF50D175)
                                  : const Color(0xFF5EC286),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            'Add a new business meeting to track',
                            textAlign: TextAlign.center,
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
                        Image.asset('assets/arrow.png')
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: getMeetings(),
                    )
                  ],
                )),
        ),
        const BottomBar()
      ]),
    );
  }

  Widget getMeetings() {
    List<Widget> list = [];
    for (var meeting in meetings) {
      list.add(InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => MeetingDescriptionPage(
                        meeting: meeting,
                      )),
            );
          },
          child: MeetingWidget(
            meeting: meeting,
            showChevron: true,
          )));
      list.add(const SizedBox(
        height: 12,
      ));
    }
    return Column(
      children: list,
    );
  }
}
