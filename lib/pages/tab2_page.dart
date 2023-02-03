import 'package:flutter/material.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: Center(child: Text('Tab2 page')),
    );
  }
}