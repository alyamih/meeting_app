import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_app/model/meeting_item.dart';
import 'package:meeting_app/pages/add_meeting_comment.dart';
import 'package:meeting_app/pages/home_page.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddMeetingPage extends StatefulWidget {
  const AddMeetingPage({super.key, required this.isEdit});
  final bool isEdit;
  @override
  State<AddMeetingPage> createState() => _AddMeetingPageState();
}

class _AddMeetingPageState extends State<AddMeetingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  EPeopleCount selected = EPeopleCount.fisrt;
  List<EPeopleCount> peopleCount = [
    EPeopleCount.fisrt,
    EPeopleCount.second,
    EPeopleCount.third
  ];
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      nameController.text = currentMeeting.name!;
      dateController.text =
          DateFormat(' MM/dd/yyyy').format(currentMeeting.date!);
      selected = currentMeeting.people!;
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
                      'What\'s the meeting?',
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
                  controller: nameController,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
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
                    nameController.text = text;
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
                      'Meeting date',
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
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            surfaceTintColor:
                                Provider.of<ThemeProvider>(context)
                                            .currentTheme ==
                                        ThemeClass.lightTheme
                                    ? const Color(0xFFEBF5ED)
                                    : const Color(0xFF1E2321),
                            backgroundColor: Provider.of<ThemeProvider>(context)
                                        .currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFFEBF5ED)
                                : const Color(0xFF1E2321),
                            child: SizedBox(
                              width: 500,
                              height: 100,
                              child: CupertinoTheme(
                                data: CupertinoThemeData(
                                  textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle: TextStyle(
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .currentTheme ==
                                                  ThemeClass.darkTheme
                                              ? const Color(0xFFEBF5ED)
                                              : const Color(0xFF1E2321),
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15)),
                                ),
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  itemExtent: 50,
                                  initialDateTime: _selectedDate,
                                  onDateTimeChanged: (DateTime newDate) {
                                    setState(() {
                                      _selectedDate = newDate;
                                      dateController.text =
                                          DateFormat(' MM/dd/yyyy')
                                              .format(_selectedDate);
                                    });
                                  },
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  cursorColor: Colors.grey,
                  controller: dateController,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Provider.of<ThemeProvider>(context).currentTheme ==
                              ThemeClass.lightTheme
                          ? const Color(0xFF1E2321)
                          : const Color(0xFFEBF5ED),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  decoration: InputDecoration(
                    // hintText: 'Date',
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
                    dateController.text = text;
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
                        'How many people will be at the meeting?',
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
                child: getPeopleCount(),
              )
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: InkWell(
            onTap: () {
              if (!widget.isEdit) {
                currentMeeting.id = const Uuid().v1();
              }
              if (nameController.text.isNotEmpty &&
                  dateController.text.isNotEmpty) {
                currentMeeting.name = nameController.text;
                currentMeeting.date = _selectedDate;
                currentMeeting.people = selected;

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => AddMeetingComment(
                            isEdit: widget.isEdit,
                          )),
                );
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? nameController.text.isNotEmpty &&
                              dateController.text.isNotEmpty
                          ? const Color(0xFF50D175)
                          : const Color(0xFF50D175).withOpacity(0.7)
                      : nameController.text.isNotEmpty &&
                              dateController.text.isNotEmpty
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

  Widget getPeopleCount() {
    List<Widget> list = [];
    for (var count in peopleCount) {
      list.add(InkWell(
        onTap: () {
          selected = count;
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Provider.of<ThemeProvider>(context).currentTheme ==
                      ThemeClass.lightTheme
                  ? selected == count
                      ? const Color(0xFF50D175)
                      : const Color(0xFFC8ECD2)
                  : selected == count
                      ? const Color(0xFF5EC286)
                      : const Color(0xFF2E3B37),
              border: Border.all(
                  color: Provider.of<ThemeProvider>(context).currentTheme ==
                          ThemeClass.lightTheme
                      ? selected == count
                          ? const Color(0xFF253126)
                          : Colors.transparent
                      : selected == count
                          ? const Color(0xFFEBF0EB)
                          : Colors.transparent,
                  width: 1),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                count.text,
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
