import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_app/model/meeting_item.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';

class MeetingWidget extends StatelessWidget {
  const MeetingWidget(
      {super.key, required this.meeting, required this.showChevron});
  final MeetingItem meeting;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context).currentTheme ==
                  ThemeClass.lightTheme
              ? const Color(0xFFC8ECD2)
              : const Color(0xFF2E3B37),
          borderRadius: BorderRadius.circular(4)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(meeting.name!,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? const Color(0xFF1E2321)
                        : const Color(0xFFEBF5ED),
                  )),
              if (showChevron)
                Icon(
                  Icons.chevron_right,
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? const Color(0xFF50D175)
                      : const Color(0xFF5EC286),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              Text('Organizer',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? const Color(0xFF1E2321)
                        : const Color(0xFFEBF5ED),
                  )),
              const SizedBox(
                width: 8,
              ),
              Text(
                meeting.organizer!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
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
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Text('Number of people',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? const Color(0xFF1E2321)
                        : const Color(0xFFEBF5ED),
                  )),
              const SizedBox(
                width: 8,
              ),
              Text(
                meeting.people!.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Provider.of<ThemeProvider>(context).currentTheme ==
                            ThemeClass.lightTheme
                        ? const Color(0xFF50D175)
                        : const Color(0xFF5EC286),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              decoration: BoxDecoration(
                  color: meeting.urgency == EUrgency.notUrgent
                      ? const Color(0xFF25A611)
                      : meeting.urgency == EUrgency.medium
                          ? const Color(0xFFD74F25)
                          : const Color(0xFFCC2121),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                meeting.urgency!.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Color(0xFFEBF0EB),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(11, 6, 11, 6),
              decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? const Color(0xFFEBF5ED)
                      : const Color(0xFF1E2321),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                DateFormat(' MM/dd/yyyy').format(meeting.date!),
                textAlign: TextAlign.center,
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
        )
      ]),
    );
  }
}
