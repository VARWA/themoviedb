import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inhereted/provider.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_model.dart';

import '../movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  final movieListModel = MovieListModel();

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieListModel.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TMDB"),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const Text("Новости"),
          NotifierProvider(
            create: () => movieListModel,
            isManagingModel: false,
            child: const MovieListWidget(),
          ),
          const Text("Сериалы"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Новости"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Фильмы"),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Сериалы"),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}
