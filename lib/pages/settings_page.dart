import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/pages/add_meeting_comment.dart';
import 'package:meeting_app/pages/greeting_page.dart';
import 'package:meeting_app/pages/show_screen.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ThemeData theme;
  bool notif = true;

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Settings',
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
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color:
                            Provider.of<ThemeProvider>(context).currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFFC8ECD2)
                                : const Color(0xFF2E3B37),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Your opinion is important!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Provider.of<ThemeProvider>(context)
                                          .currentTheme ==
                                      ThemeClass.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'We need your feedback to get better',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Provider.of<ThemeProvider>(context)
                                          .currentTheme ==
                                      ThemeClass.lightTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            color: Provider.of<ThemeProvider>(context)
                                        .currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFF50D175)
                                : const Color(0xFF5EC286),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          'Rate app',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
                    decoration: BoxDecoration(
                        color:
                            Provider.of<ThemeProvider>(context).currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFFC8ECD2)
                                : const Color(0xFF2E3B37),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: InkWell(
                          onTap: () {
                            showCurrencyPicker(
                                context: context,
                                theme: CurrencyPickerThemeData(
                                  backgroundColor: const Color(0xFF5EC286),
                                  flagSize: 25,
                                  titleTextStyle: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'SF Pro Text',
                                  ),
                                  subtitleTextStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'SF Pro Text',
                                      color: Theme.of(context).hintColor),
                                  bottomSheetHeight:
                                      MediaQuery.of(context).size.height / 2,
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFF8C98A8)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                ),
                                onSelect: (Currency currency) {
                                  user.currency = currency.code;
                                  setState(() {});
                                  addToSP();
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/currency.png'),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Currency',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .currentTheme ==
                                                    ThemeClass.lightTheme
                                                ? const Color(0xFF1E2321)
                                                : const Color(0xFFEBF5ED),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    user.currency != null ? user.currency! : '',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .currentTheme ==
                                                    ThemeClass.lightTheme
                                                ? const Color(0xFF253126)
                                                    .withOpacity(0.5)
                                                : const Color(0xFFEBF0EB)
                                                    .withOpacity(0.5),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Provider.of<ThemeProvider>(context)
                                                .currentTheme ==
                                            ThemeClass.lightTheme
                                        ? const Color(0xFF253126)
                                            .withOpacity(0.5)
                                        : const Color(0xFFEBF0EB)
                                            .withOpacity(0.5),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/safety.png'),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Safety',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .currentTheme ==
                                                    ThemeClass.lightTheme
                                                ? const Color(0xFF1E2321)
                                                : const Color(0xFFEBF5ED),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Provider.of<ThemeProvider>(context)
                                            .currentTheme ==
                                        ThemeClass.lightTheme
                                    ? const Color(0xFF253126).withOpacity(0.5)
                                    : const Color(0xFFEBF0EB).withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/notification.png'),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Notification',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .currentTheme ==
                                                    ThemeClass.lightTheme
                                                ? const Color(0xFF1E2321)
                                                : const Color(0xFFEBF5ED),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              CupertinoSwitch(
                                value: notif,
                                onChanged: (bool val) {
                                  notif = val;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/theme.png'),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Dark Theme',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      color: Provider.of<ThemeProvider>(context)
                                                  .currentTheme ==
                                              ThemeClass.lightTheme
                                          ? const Color(0xFF1E2321)
                                          : const Color(0xFFEBF5ED),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            CupertinoSwitch(
                              value: Provider.of<ThemeProvider>(context)
                                      .currentTheme ==
                                  ThemeClass.darkTheme,
                              onChanged: (bool val) {
                                context
                                    .read<ThemeProvider>()
                                    .changeCurrentTheme();
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
                    decoration: BoxDecoration(
                        color:
                            Provider.of<ThemeProvider>(context).currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFFC8ECD2)
                                : const Color(0xFF2E3B37),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const ReadTermsOrPrivacyScreenView(
                                          link: 'google.com',
                                        )),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/rate.png'),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      'Rate app',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .currentTheme ==
                                                  ThemeClass.lightTheme
                                              ? const Color(0xFF1E2321)
                                              : const Color(0xFFEBF5ED),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const ReadTermsOrPrivacyScreenView(
                                        link: 'google.com',
                                      )),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/privacy.png'),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .currentTheme ==
                                                    ThemeClass.lightTheme
                                                ? const Color(0xFF1E2321)
                                                : const Color(0xFFEBF5ED),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
