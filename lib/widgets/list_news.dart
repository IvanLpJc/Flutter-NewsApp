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
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: _New(article: news[index], index: index),
          );
        });
  }
}

class _New extends StatelessWidget {
  final Article article;
  final int index;
  const _New({required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: const Color.fromARGB(20, 255, 255, 255)),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          _TopBarCard(article, index),
          _TitleCard(article),
          _ImageCard(article),
          _BodyCard(article),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const _ButtonsCard(),
        ],
      ),
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
      child: Row(children: [
        Text(
          '${index + 1}. ',
          style: TextStyle(color: darkTheme.colorScheme.secondary),
        ),
        Text(
          '${article.source.name}. ',
          style: TextStyle(color: darkTheme.colorScheme.secondary),
        ),
      ]),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article article;

  const _TitleCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        article.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article article;

  const _ImageCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Container(
          child: (article.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/giphy.gif'),
                  image: NetworkImage(article.urlToImage!),
                )
              : const Image(image: AssetImage('assets/no-image.png')),
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article article;

  const _BodyCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(article.description ?? ''),
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  const _ButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RawMaterialButton(
            onPressed: () {},
            child: Icon(Icons.star_border),
            fillColor: darkTheme.colorScheme.secondary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          RawMaterialButton(
            onPressed: () {},
            child: Icon(Icons.more_horiz),
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }
}
