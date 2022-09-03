import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListTile(),
    );
  }
}

class MyListTile extends StatelessWidget {
  MyListTile({Key? key}) : super(key: key);
  final List<String> items = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Static ListTileWidget')),
      body: Center(
          child: ListView(
        children: items
            .map((data) => ListTile(
                  title: Text(data),
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfileScreen(itemHolder: data)));
                  }),
                ))
            .toList(),
      )),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.itemHolder}) : super(key: key);
  final String itemHolder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                'Selected Item  = $itemHolder',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                textColor: Colors.white,
                color: Colors.lightBlue,
                child: Text('Go Back Btn'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
