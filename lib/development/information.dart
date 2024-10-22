//flutter pub run build_runner build
import 'package:flutter/material.dart';

class DenemEkran extends StatefulWidget {
  const DenemEkran({super.key});

  @override
  State<DenemEkran> createState() => _DenemEkranState();
}

class _DenemEkranState extends State<DenemEkran> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
