import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () => {}, icon: const Icon(Icons.menu, color: Color(0xFFF2994A),)),
            title: const Text('Appetito', style: TextStyle(color: Color(0xFFF2994A), fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
            backgroundColor: const Color(0xffffffff),
            // actions: [
            //   IconButton(onPressed: () => {}, icon: const Icon(Icons.menu))
            // ],
          ),
          body: Text('Menu'),
        ),
      ),
    );
  }
}
