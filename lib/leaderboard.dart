import 'package:figma/home.dart';
import 'package:figma/leaderboardpage.dart';
import 'package:figma/message.dart';
import 'package:figma/profile.dart';
import 'package:flutter/material.dart';

class Leader extends StatefulWidget {
  const Leader({super.key});

  @override
  State<Leader> createState() => _LeaderState();
}

class _LeaderState extends State<Leader> {
  int _selectedIndex = 0;
  
   List<Widget> get _pages => [
    homep(),
    Message(),
    Aage(),
    Profile()
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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,
                size: 40, color: const Color.fromARGB(255, 21, 20, 20)),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child:_pages[_selectedIndex],
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(children: <Widget>[
            ListTile(
              title: Text('Primary'),
            ),
            ListTile(
              title: Text('Draft'),
            ),
            ListTile(
              title: Text('Send'),
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: const Color.fromARGB(239, 5, 10, 168),
        unselectedItemColor: const Color.fromARGB(170, 15, 15, 15),
        onTap: _onItemTapped,
      ),
    );
  }
}
