import 'package:flutter/material.dart';

// Stateful widget representing a search bar view
class SearchBarView extends StatefulWidget{
  const SearchBarView({super.key});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

// State class for SearchBarView widget
class _SearchBarViewState extends State<SearchBarView> {

  // Controller for handling search text input
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar( 
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffF5F5F5),
        toolbarHeight: 80,

        // Search bar builder
        title: SearchAnchor(
        builder: (BuildContext context, SearchController controller){
          return SearchBar( 
            controller: controller,
            hintText: 'Search',
            hintStyle: const MaterialStatePropertyAll<TextStyle>(TextStyle(fontSize: 20)),
            padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: (){
              controller.openView();
            },
            onChanged: (_){
              controller.openView();
            },
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller){
          return List<ListTile>.generate(5,(int index){
            final String item = 'item $index';
            return ListTile(
              title:Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        },),
      ), 
    );
  }
}



