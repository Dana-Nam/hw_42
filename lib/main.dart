import 'package:flutter/material.dart';

void main() {
  runApp(const CocktailSearchApp());
}

class CocktailSearchApp extends StatefulWidget {
  const CocktailSearchApp({super.key});

  @override
  State<CocktailSearchApp> createState() => _CocktailSearchAppState();
}

class _CocktailSearchAppState extends State<CocktailSearchApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Поиск коктейлей')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Найти'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
