import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  // Lista de usuários fictícios
  final List<Map<String, String>> users = [
    {'username': 'user1'},
    {'username': 'user2'},
    {'username': 'user3'},
    {'username': 'user4'},
    {'username': 'user5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(221, 2, 0, 11),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.feedback, color: Colors.white,),
                title: Text('Feedbacks'),
                textColor: Colors.white,
                onTap: () {
                  Navigator.pushNamed(context, '/feed');
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: const Color.fromARGB(25, 255, 255, 255)), 
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];
          return ListTile(
            leading: CircleAvatar(),
            title: Text(
              user['username']!,
              style: TextStyle(color: Colors.white), 
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: {
                  'Nome': user['username'],
                },
              );
            },
          );
        },
      ),
    );
  }
}