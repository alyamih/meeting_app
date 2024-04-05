import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/model/meeting_item.dart';
import 'package:meeting_app/model/user.dart';
import 'package:meeting_app/pages/greeting_page.dart';
import 'package:meeting_app/pages/home_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMeetingComment extends StatefulWidget {
  const AddMeetingComment({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<AddMeetingComment> createState() => _AddMeetingCommentState();
}

class _AddMeetingCommentState extends State<AddMeetingComment> {
  TextEditingController commentController = TextEditingController();
  TextEditingController whoOrganizeController = TextEditingController();
  EUrgency selected = EUrgency.notUrgent;
  List<EUrgency> urgency = [
    EUrgency.notUrgent,
    EUrgency.medium,
    EUrgency.urgent
  ];
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      commentController.text = currentMeeting.comment!;
      whoOrganizeController.text = currentMeeting.organizer!;
      selected = currentMeeting.urgency!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 18),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.chevron_left,
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? const Color(0xFF50D175)
                      : const Color(0xFF5EC286),
                ),
                Text(
                  'Back',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? const Color(0xFF50D175)
                          : const Color(0xFF5EC286),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Row(
            children: [
              Text(
                'New meeting',
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
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Comment about meeting',
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
                  maxLines: 4,
                  controller: commentController,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? const Color(0xFF1E2321)
                          : const Color(0xFFEBF5ED),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  decoration: InputDecoration(
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
                    commentController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Who organizes the meeting?',
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
                  controller: whoOrganizeController,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? const Color(0xFF1E2321)
                          : const Color(0xFFEBF5ED),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  decoration: InputDecoration(
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
                    whoOrganizeController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Urgency of the meeting',
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
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal, child: getUrgent())
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: InkWell(
            onTap: () {
              currentMeeting.comment = commentController.text;
              currentMeeting.organizer = whoOrganizeController.text;
              currentMeeting.urgency = selected;
              if (widget.isEdit) {
                meetings
                    .removeWhere((element) => element.id == currentMeeting.id);
              }
              meetings.add(currentMeeting);
              addToSP();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage()),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? commentController.text.isNotEmpty &&
                              whoOrganizeController.text.isNotEmpty
                          ? const Color(0xFF50D175)
                          : const Color(0xFF50D175).withOpacity(0.7)
                      : commentController.text.isNotEmpty &&
                              whoOrganizeController.text.isNotEmpty
                          ? const Color(0xFF5EC286)
                          : const Color(0xFF5EC286).withOpacity(0.7),
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
    );
  }

  Widget getUrgent() {
    List<Widget> list = [];
    for (var urgent in urgency) {
      list.add(InkWell(
        onTap: () {
          selected = urgent;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? selected == urgent
                          ? const Color(0xFF253126)
                          : Colors.transparent
                      : selected == urgent
                          ? const Color(0xFFEBF0EB)
                          : Colors.transparent,
                  width: 1),
              color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme &&
                      selected != urgent
                  ? const Color(0xFFC8ECD2)
                  : Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.darkTheme &&
                          selected != urgent
                      ? const Color(0xFF2E3B37)
                      : Provider.of<ThemeProvider>(context).currentTheme ==
                                  ThemeClass.lightTheme &&
                              selected == urgent
                          ? const Color(0xFF50D175)
                          : Provider.of<ThemeProvider>(context).currentTheme ==
                                      ThemeClass.darkTheme &&
                                  selected == urgent
                              ? const Color(0xFF5EC286)
                              : Colors.transparent,
              borderRadius: BorderRadius.circular(4)),
          child: Text(
            urgent.text,
            style: TextStyle(
                fontFamily: 'SF Pro Text',
                color: urgent == EUrgency.notUrgent && selected != urgent
                    ? const Color(0xFF25A611)
                    : urgent == EUrgency.medium && selected != urgent
                        ? const Color(0xFFD74F25)
                        : urgent == EUrgency.urgent && selected != urgent
                            ? const Color(0xFFCC2121)
                            : Provider.of<ThemeProvider>(context)
                                            .currentTheme ==
                                        ThemeClass.darkTheme &&
                                    selected == urgent
                                ? const Color(0xFFEBF0EB)
                                : const Color(0xFF253126),
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
        ),
      ));
      list.add(const SizedBox(
        width: 8,
      ));
    }
    return Row(
      children: list,
    );
  }
}

Future<void> addToSP() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('meetings', jsonEncode(meetings));

  prefs.setString('user', jsonEncode(user));
}

void getSP(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('user') != null) {
    Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
    user = UserItem.fromJson(userMap);
  }
  final List<dynamic> jsonData1 =
      jsonDecode(prefs.getString('meetings') ?? '[]');

  meetings = jsonData1.map<MeetingItem>((jsonList) {
    {
      return MeetingItem.fromJson(jsonList);
    }
  }).toList();

  callBack();
}
