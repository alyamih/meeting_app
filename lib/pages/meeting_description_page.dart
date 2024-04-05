import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/model/meeting_item.dart';
import 'package:meeting_app/pages/add_meeting_comment.dart';
import 'package:meeting_app/pages/add_meeting_page.dart';
import 'package:meeting_app/pages/home_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:meeting_app/widgets/meeting_widget.dart';
import 'package:provider/provider.dart';

class MeetingDescriptionPage extends StatefulWidget {
  const MeetingDescriptionPage({super.key, required this.meeting});
  final MeetingItem meeting;

  @override
  State<MeetingDescriptionPage> createState() => _MeetingDescriptionPageState();
}

class _MeetingDescriptionPageState extends State<MeetingDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).currentTheme ==
              ThemeClass.lightTheme
          ? const Color(0xFFEBF5ED)
          : const Color(0xFF1E2321),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
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
                          color: Provider.of<ThemeProvider>(context)
                                      .currentTheme ==
                                  ThemeClass.lightTheme
                              ? const Color(0xFF50D175)
                              : const Color(0xFF5EC286),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  currentMeeting = widget.meeting;
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AddMeetingPage(
                              isEdit: true,
                            )),
                  );
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? const Color(0xFF50D175)
                          : const Color(0xFF5EC286),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Row(
            children: [
              Text(
                'Meeting details',
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
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: MeetingWidget(
                meeting: widget.meeting,
                showChevron: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Comment',
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? const Color(0xFFC8ECD2)
                        : const Color(0xFF2E3B37),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  widget.meeting.comment!,
                  maxLines: 4,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? const Color(0xFF1E2321)
                          : const Color(0xFFEBF5ED),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ]),
        )),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          child: InkWell(
            onTap: () {
              meetings
                  .removeWhere((element) => element.id == widget.meeting.id);
              addToSP();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? const Color(0xFF50D175)
                      : const Color(0xFF50D175).withOpacity(0.7)),
              child: const Text(
                'Delete info',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
