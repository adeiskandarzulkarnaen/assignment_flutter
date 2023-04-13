import 'package:flutter/material.dart';
import 'package:pertemuan_v/models/news.dart';
import 'package:pertemuan_v/modules/home_screen/fragments/home_fragment/home_fragment_widgets.dart';

class NewsFragment extends StatelessWidget {
  final List<News> latesNews;

  const NewsFragment({
    super.key,
    required this.latesNews
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox( height: MediaQuery.of(context).padding.top),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: HomeFragmentWidget.latestNewsSection(
                  size,
                  latesNews
                  /* new: add list lates-news */
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
