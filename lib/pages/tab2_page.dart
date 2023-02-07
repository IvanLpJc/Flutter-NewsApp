import 'package:flutter/material.dart';
import 'package:news_provider/models/category_model.dart';
import 'package:news_provider/services/news_service.dart';
import 'package:news_provider/theme/theme.dart';
import 'package:news_provider/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: Column(
        children: [
          const _CategoriesList(),
          newsService.isLoading
              ? Container(
                  padding: EdgeInsets.only(top: 10),
                  child: LinearProgressIndicator(
                    color: darkTheme.colorScheme.secondary,
                  ))
              : Expanded(
                  child: NewsList(news: newsService.getArticlesByCategory))
        ],
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: newsService.categories.length,
          itemBuilder: (BuildContext context, index) {
            final categoryName = newsService.categories[index].name;

            return GestureDetector(
              onTap: () {
                newsService.selectedCategory = categoryName;
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: (newsService.selectedCategory == categoryName)
                          ? darkTheme.colorScheme.secondary
                          : Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: 110,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      _CategoryButton(category: newsService.categories[index]),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${categoryName[0].toUpperCase()}${categoryName.substring(1)}',
                        style: TextStyle(
                            fontWeight:
                                (newsService.selectedCategory == categoryName)
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (newsService.selectedCategory == category.name)
            ? darkTheme.colorScheme.secondary
            : Colors.white,
      ),
      child: Icon(
        category.icon,
        color: (newsService.selectedCategory == category.name)
            ? Colors.white
            : Colors.black54,
      ),
    );
  }
}
