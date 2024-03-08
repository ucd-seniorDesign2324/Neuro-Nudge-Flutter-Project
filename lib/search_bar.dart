import 'package:flutter/material.dart';


class SearchBarView extends StatefulWidget{
  const SearchBarView({super.key});

  @override
  State<SearchBarView> createState() => _SearchBarViewState();
}

class _SearchBarViewState extends State<SearchBarView> {

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar( 
        title: TextField( 

          controller: searchController,

          decoration: InputDecoration( 
            filled: true,
            fillColor: const Color(0xffF5F5F5),
            contentPadding: const EdgeInsets.all(12),
            hintText: "Search",
            hintStyle: const TextStyle( 
              color: Colors.grey,
              fontSize: 15
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none
            )
          ),
        ),
      ),
    );
  }
}



