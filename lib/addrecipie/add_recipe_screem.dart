

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddRecipe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Colors.white,
         title: const Text('Add Recipe',style: TextStyle(color: Colors.black),),
         iconTheme: const IconThemeData(
           color: Colors.black, //change your color here
         ),
       ),
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(8),
           child: Column(
             children: [
               const TextField(
                 decoration: InputDecoration(
                   hintText: 'Recipe Name',
                 ),
               ),
               const SizedBox(height: 10,),
               const TextField(
                 decoration: InputDecoration(
                   hintText: 'Description',
                 ),
               ),
               const SizedBox(height: 10,),
               const TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   hintText: 'Fat Percentage',
                 ),
               ),
               const SizedBox(height: 10,),
               const TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   hintText: 'Protein Percentage',
                 ),
               ),
               const SizedBox(height: 10,),
               const TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   hintText: 'Cholesterol Percentage',
                 ),
               ),
               const SizedBox(height: 10,),
               const TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   hintText: 'Carbon Percentage',
                 ),
               ),
               const SizedBox(height: 10,),
               const TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   hintText: 'Ingredients',
                 ),
               ),
               const SizedBox(height: 10,),
               const TextField(
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   hintText: 'Making Steps',
                 ),
               ),
               const SizedBox(height: 15,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text(
                     'Save Recipe',
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 25,
                         fontWeight: FontWeight.w600),
                   ),
                   FloatingActionButton(
                     backgroundColor: Colors.orangeAccent,
                     child: const Icon(
                       Icons.arrow_forward,
                       color: Colors.white,
                     ),
                     onPressed: () {

                     },
                   )
                 ],
               )
             ],
           ),
         ),
       ),
     );
  }
}