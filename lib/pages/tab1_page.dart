import 'package:flutter/material.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/theme/theme.dart';
import 'package:news_provider/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: (newsService.headlines.isEmpty)
          ? Center(
              child: CircularProgressIndicator(
                color: darkTheme.colorScheme.secondary,
              ),
            )
          : NewsList(news: newsService.headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
