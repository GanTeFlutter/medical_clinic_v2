import 'package:flutter/material.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key});

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromRGBO(98, 110, 238, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Gölge rengi
            spreadRadius: 2, // Gölgenin yayılma alanı
            blurRadius: 8, // Gölgenin bulanıklığı
            offset: const Offset(0, 4), // Gölgenin yatay ve dikey konumu
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          hintText: 'Search for doctors',
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black.withOpacity(0.5),
              ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
