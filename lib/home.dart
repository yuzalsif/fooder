import 'package:flutter/material.dart';
import 'package:fooderlich/navigation/app_navigation.dart';
import 'package:provider/provider.dart';
import './models/models.dart';
import './screens/screens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipeScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Fooderlich')),
            actions: [buildProfileButton()],
          ),
          body: IndexedStack(index: tabManager.currentTab, children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: tabManager.currentTab,
            onTap: (index) {
              tabManager.goToTab(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildProfileButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 26,
        top: 8,
        bottom: 8,
      ),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundImage: AssetImage('assets/profile_pics/person_stef.jpeg'),
          backgroundColor: Colors.transparent,
        ),
        onTap: () {
          Provider.of<AppNavigation>(context, listen: false)
              .router
              .goNamed('profile');
        },
      ),
    );
  }
}
