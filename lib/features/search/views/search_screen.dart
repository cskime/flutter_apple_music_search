import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  void _onSearch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: "Search artist",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onSearch,
                child: const Text("Search"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
