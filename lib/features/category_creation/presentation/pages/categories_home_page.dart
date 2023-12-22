import 'package:flutter/material.dart';

class CategoriesHomePage extends StatelessWidget {
  const CategoriesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories Home Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Placeholder(
            child: Center(
              child: Text(
                'Category $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          );
        }),
      ),
    );
  }
}
