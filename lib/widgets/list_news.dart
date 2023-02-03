import 'package:flutter/material.dart';
import 'package:news_provider/models/news_models.dart';
import 'package:news_provider/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(article: news[index], index: index);
      });
  }
}

class _New extends StatelessWidget {
  final Article article;
  final int index;
  const _New({required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(article, index),
        _TitleCard(article, index),
        _ImageCard(article, index)
      ],
    );
  }
}

class _ImageCard extends StatelessWidget {

  final Article article;
  final int index;

  const _ImageCard(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (article.urlToImage != null)
        ? FadeInImage(
        placeholder: const AssetImage('assets/giphy.gif'),
        image: NetworkImage( article.urlToImage! ),
      )
      : const Image(image: AssetImage('assets/no-image.png')),
    );
  }
}


class _TopBarCard extends StatelessWidget {

  final Article article;
  final int index;

  const _TopBarCard(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index+1}. ', style: TextStyle(color: darkTheme.colorScheme.secondary),),
          Text('${ article.source.name }. ', style: TextStyle(color: darkTheme.colorScheme.secondary),),

        
        ]),

    );
  }
}

class _TitleCard extends StatelessWidget {

  final Article article;
  final int index;

  const _TitleCard(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text( article.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}