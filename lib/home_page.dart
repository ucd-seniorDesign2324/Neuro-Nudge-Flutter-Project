import 'package:flutter/material.dart';

    // TODO: 
    // Fetch event data and display on list tiles.
    // Implement search bar. (Tutorials available on Youtube)
    // Implement drawer menu. 
    // Define page navigations 
    // Define monthly task view (Separate into own file if you feel so lead)


class HomePage extends StatelessWidget {

  const HomePage({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context){
    const String appTitle = 'Neuro Nudge';
    return MaterialApp(
      title: appTitle,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: CardTheme(color: Colors.blue.shade50),
        useMaterial3: true,
      ),

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(appTitle),
        ),
        
        body: Center(
          child: ListView.builder(
          itemCount: items.length, 

            // prototypeItem: ListTile(
            //   title: Text(items.first),
            // ),

            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Text("Sub")),
                  title: Text("Event $index"),
                  trailing: const Icon(Icons.more_vert),
                  
                )
              );
            },
          ),
        ),
      )
    );
  }
}


// class SearchBarView extends StatelessWidget{
//   const SearchBarView({super.key})
// }


// class SideBarView extends StatelessWidget{
//   const SideBarView({super.key})
// }


