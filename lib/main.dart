import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:hw_42/models/cocktail_model.dart';
import 'package:hw_42/widget/cocktail_widget.dart';

void main() {
  runApp(const CocktailSearchApp());
}

class CocktailSearchApp extends StatefulWidget {
  const CocktailSearchApp({super.key});

  @override
  State<CocktailSearchApp> createState() => _CocktailSearchAppState();
}

class _CocktailSearchAppState extends State<CocktailSearchApp> {
  List<Cocktail> cocktails = [];
  final TextEditingController _controller = TextEditingController();

  Future<void> fetchCocktails(String query) async {
    if (query.isEmpty) return;
    final uri = Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$query');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        cocktails = data['drinks'] != null
            ? (data['drinks'] as List)
                .map((json) => Cocktail.fromJson(json))
                .toList()
            : [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Поиск коктейлей',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Поиск коктейлей')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Введите название коктейля',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => fetchCocktails(_controller.text),
                    child: const Text('Найти'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: CocktailGrid(cocktails: cocktails),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
