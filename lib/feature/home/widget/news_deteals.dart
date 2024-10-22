import 'package:flutter/material.dart';

class NewsDeteals extends StatefulWidget {
  const NewsDeteals({super.key});

  @override
  State<NewsDeteals> createState() => _NewsDetealsState();
}

class _NewsDetealsState extends State<NewsDeteals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsDeteals'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
