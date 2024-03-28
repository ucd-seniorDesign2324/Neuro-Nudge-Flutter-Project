import 'package:flutter/material.dart';
import 'package:nn/presentation/search_bar.dart';


AppBar appBarBuilder(BuildContext context, String appTitle) {
  return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,

      title: Text( 
        appTitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.black,
        ),
      ),

      backgroundColor: const Color(0xffF5F5F5),

      // Search icon on far right. Navigates to search page when pressed.
      actions:[
        IconButton( 
          icon: const Icon( 
            Icons.search,
            semanticLabel: 'search',
          ),
          iconSize: 30.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchBarView()),
            );
          },
        ),
      ]
    );
}
