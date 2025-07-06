import 'package:flutter/material.dart';
import 'package:movie_app/features/main/domain/entity/custom_home_app_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/bottom_nav_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/home_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/profile_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/search_section.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'main_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onItemTapped: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: SafeArea(child: _widgetOptions[currentIndex]),
    );
  }
}

List<Widget> _widgetOptions = <Widget>[
  HomeSection(),
  SearchSection(),
  ProfileSection(),
];
