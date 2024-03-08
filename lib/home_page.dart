import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

import 'package:nn/search_bar.dart';
import 'package:nn/methods/drawer_menu.dart';

    // TODO: 
    // Fetch event data and display on list tiles.
    // Define page navigations 
    // Define monthly task view (Separate into own file if you feel so lead)


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  // final List<String> items;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context){
    const String appTitle = 'NeuroNudge';
    return Scaffold(

        appBar: appBar(appTitle),

        drawer: drawerMenuBuilder(context),
        
        // TODO: Add floating action button
        
        body: Column(
          children: [
            Expanded(
              child: listBuilder()
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton( 
          backgroundColor: Colors.black,
          onPressed: (){
            Placeholder();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 45,)
        ),
      );
  }

  Center listBuilder() {
    // Generates cards

    return Center(
        child: ListView.builder(
          itemCount: 20, 

          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Text("Sub")),
                title: Text("Event $index"),
                subtitle: Text("Task $index"),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // TODO: Add navigation to task management view
                  },
                ),
              )
            );
          },
        ),
      );
  }

  AppBar appBar(String appTitle) {
    return AppBar(

        centerTitle: true,

        title: Text( 
          appTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0)
          ),

        backgroundColor: const Color(0xffF5F5F5),

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
}


