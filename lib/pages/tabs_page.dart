import 'package:flutter/material.dart';
import 'package:news_provider/pages/tab1_page.dart';
import 'package:news_provider/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => _NavigationModel(),
        child: const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: _Pages(),
          ),
          bottomNavigationBar: _Navigation(),
        ),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: ( value ) => navigationModel.currentPage = value,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);


    return PageView(
      //physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      controller: navigationModel.pageController,
      onPageChanged: (value) => navigationModel.currentPage = value,
      children: [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  final PageController _pageController = PageController();

  set currentPage(int value) {
    _currentPage = value;
        _pageController.animateToPage(value, duration: const Duration(milliseconds: 50), curve: Curves.linear);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
