import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex_graphql_task/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const MainPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/spacex_image.png', fit: BoxFit.cover, width: double.infinity)
    );
  }
}
