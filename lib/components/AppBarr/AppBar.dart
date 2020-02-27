import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 2.0,
            floating: false,
            pinned: true,
          )
        ],
      ),
    );
  }
}