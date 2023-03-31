import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_database2/pages/account_page.dart';
import 'package:local_database2/pages/user_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('pdp_online');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserPage(),
      routes: {
        AccountPage.id: (context) => const AccountPage(),
      },
    );
  }
}