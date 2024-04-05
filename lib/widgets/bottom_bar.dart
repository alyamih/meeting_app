import 'package:flutter/material.dart';
import 'package:meeting_app/model/meeting_item.dart';
import 'package:meeting_app/pages/add_meeting_page.dart';
import 'package:meeting_app/pages/home_page.dart';
import 'package:meeting_app/pages/news_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';

enum EPageOnSelect {
  home,
  add,
  news,
}

EPageOnSelect page = EPageOnSelect.home;

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context).currentTheme ==
                  ThemeClass.lightTheme
              ? const Color(0xFFEBF5ED)
              : const Color(0xFF1E2321),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15.0,
              spreadRadius: 10.0,
              offset: const Offset(
                5.0,
                5.0,
              ),
            )
          ]),
      padding: const EdgeInsets.fromLTRB(30, 7, 30, 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (page != EPageOnSelect.home) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
              }
              page = EPageOnSelect.home;
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 55,
                child: Image.asset(
                  'assets/home.png',
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? page == EPageOnSelect.home
                          ? const Color(0xFF50D175)
                          : const Color(0xFF253126)
                      : page == EPageOnSelect.home
                          ? const Color(0xFF50D175)
                          : const Color(0xFFEBF0EB),
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.add;
              currentMeeting = MeetingItem();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const AddMeetingPage(
                          isEdit: false,
                        )),
              );

              setState(() {});
            },
            child: SizedBox(
                height: 50, width: 50, child: Image.asset('assets/add.png')),
          ),
          InkWell(
            onTap: () {
              if (page != EPageOnSelect.news) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const NewsPage()),
                    (route) => false);
              }
              page = EPageOnSelect.news;

              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/news.png',
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? page == EPageOnSelect.news
                          ? const Color(0xFF50D175)
                          : const Color(0xFF253126)
                      : page == EPageOnSelect.news
                          ? const Color(0xFF50D175)
                          : const Color(0xFFEBF0EB),
                )),
          ),
        ],
      ),
    );
  }
}
