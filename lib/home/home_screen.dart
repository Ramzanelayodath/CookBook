
import 'package:cookbook/home/cubit/home_cubit.dart';
import 'package:cookbook/util/router_vairables.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getRecipe();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                editorsChoice(context),
                const SizedBox(height: 13,),
                list(context)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add,color: Colors.white,),
        onPressed: (){
          Navigator.pushNamed(context, add_item);
        },
      ),
    );
  }

  Widget editorsChoice(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child:  Column(
          children: [
            const SizedBox(height: 8,),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Editors Pick',style: TextStyle(fontSize: 25,color: Colors.black54),),
            ),
            const SizedBox(height: 8,),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('A Pantry full of colourful gustes',style: TextStyle(fontSize: 14,color: Colors.black54),),
            ),
            const SizedBox(height: 3,),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Make under ten minutes!',style: TextStyle(fontSize: 14,color: Colors.black54),),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.bookmark,color: Colors.black,),
                const SizedBox(height: 15,),
                Image.asset('assets/images/plate2.png',width: 125,height: 125,fit: BoxFit.cover,)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget list(BuildContext context){
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children:  [
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                    child: Image.asset('assets/images/plate2.png'),
                  ),
                  const SizedBox(height: 5,),
                  const Text('APPERIZER PLATTER',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
              decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, item_details);
            },
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash_img_plate.png'),
                const Padding(padding: EdgeInsets.only(right: 8),
                  child: Text('CHICKEN \n TIKKA',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),)
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                  child: Image.asset('assets/images/plate4.png'),
                ),
                const SizedBox(height: 5,),
                const Text('SALAD',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                  child: Image.asset('assets/images/plate3.png'),
                ),
                const SizedBox(height: 5,),
                const Text('ORANGE CHICKEN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                  child: Image.asset('assets/images/splash_img_plate.png'),
                ),
                const SizedBox(height: 5,),
                const Text('ORANGE CHICKEN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                  child: Image.asset('assets/images/plate4.png'),
                ),
                const SizedBox(height: 5,),
                const Text('SALAD',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                  child: Image.asset('assets/images/plate3.png'),
                ),
                const SizedBox(height: 5,),
                const Text('ORANGE CHICKEN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Container(
            height: 100,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                  child: Image.asset('assets/images/splash_img_plate.png'),
                ),
                const SizedBox(height: 5,),
                const Text('ORANGE CHICKEN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
      ],
    );
  }
}