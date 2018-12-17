import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to SearchScreen'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(5, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline,
            ),
          );
        }),
      ),
    );
  }

}