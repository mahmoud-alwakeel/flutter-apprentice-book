import 'package:ch_two/widgets/card1.dart';
import 'package:ch_two/widgets/card2.dart';
import 'package:ch_two/widgets/card3.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Card1(),
    Card2(),
    Card3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fooderlich', style: Theme.of(context).textTheme.bodyLarge
            // style: theme.textTheme.bodyLarge
            ),
      ),
      body: pages[_selectedIndex],
      // Center(
      //   child: Text(
      //     'Let\'s get cooking 🥰',
      //     style: Theme.of(context).textTheme.headlineLarge,
      //     // style: theme.textTheme.headlineLarge,
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'card2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'card3',
            ),
          ]),
    );
  }
}
