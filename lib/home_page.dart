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
      debugShowCheckedModeBanner: false,
      // Basic theme. Will be modified down the road.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: CardTheme(color: Colors.blue.shade50),
        useMaterial3: true,
      ),

      home: Scaffold(
        appBar: AppBar(
          leading: IconButton( 
            icon: const Icon( 
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(appTitle),

          // TODO: Add search bar
        ),

        // TODO: Add drawer menu
        
        // TODO: Add floating action button
        
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
                  subtitle: Text("Task $index"),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () { // Open task management view
                      // TODO: Add navigation to task management view
                    },),
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


// class DrawerMenuView extends StatelessWidget{
//   const SideBarView({super.key})
// }


