import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/model/news_item.dart';
import 'package:meeting_app/theme.dart';
import 'package:meeting_app/theme_notifier.dart';
import 'package:provider/provider.dart';

class DescriptionNewsPage extends StatefulWidget {
  const DescriptionNewsPage({
    super.key,
    required this.news,
    required this.newsList,
  });
  final NewsItem news;
  final List<NewsItem> newsList;

  @override
  State<DescriptionNewsPage> createState() => _DescriptionNewsPageState();
}

class _DescriptionNewsPageState extends State<DescriptionNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).currentTheme ==
              ThemeClass.lightTheme
          ? const Color(0xFFEBF5ED)
          : const Color(0xFF1E2321),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 50),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        color:
                            Provider.of<ThemeProvider>(context).currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFF50D175)
                                : const Color(0xFF5EC286),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          height: 178,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    widget.news.image!,
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          widget.news.title!,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Provider.of<ThemeProvider>(context)
                                          .currentTheme ==
                                      ThemeClass.lightTheme
                                  ? const Color(0xFF1E2321)
                                  : const Color(0xFFEBF5ED),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        widget.news.text!,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Provider.of<ThemeProvider>(context)
                                        .currentTheme ==
                                    ThemeClass.lightTheme
                                ? const Color(0xFF1E2321).withOpacity(0.7)
                                : const Color(0xFFEBF5ED).withOpacity(0.7),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 16, 10),
                      child: Row(
                        children: [
                          Text(
                            'Other news',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                color: Provider.of<ThemeProvider>(context)
                                            .currentTheme ==
                                        ThemeClass.lightTheme
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    getMoreNews()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getMoreNews() {
    List<Widget> list = [];
    for (var news in widget.newsList) {
      list.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => DescriptionNewsPage(
                        news: news,
                        newsList: widget.newsList,
                      )),
            );
          },
          child: Stack(
            children: [
              Container(
                height: 316,
                width: 250,
                margin: const EdgeInsets.only(bottom: 12, right: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xff3fcc5e),
                          Color(0xFF02341C)
                        ]),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          news.image!,
                        ))),
              ),
              Container(
                height: 316,
                width: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xff3fcc5e),
                      ]),
                ),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      news.title!,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }
}
