

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: NestedScrollView(
         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
           return <Widget>[
             SliverAppBar(
               expandedHeight: 160.0,
               floating: false,
               pinned: true,
               backgroundColor: Colors.black,
               flexibleSpace: FlexibleSpaceBar(
                   centerTitle: true,
                   background: Image.asset('assets/images/burger.jpg',height: 200,fit: BoxFit.fill,)),
             ),
           ];
         },
         body: SizedBox(
           width: double.infinity,
           height: double.infinity,
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(10),
               child: Column(
                 children: [
                   const SizedBox(height: 20,),
                   recipeDetails(),
                   const SizedBox(height: 25,),
                   ingredientDetails(context),
                   const SizedBox(height: 15,),
                   makingSteps()
                 ],
               ),
             ),
           ),
           
         )
       ),
     );
  }

  Widget recipeDetails(){
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text('SOY KEBAB',style: TextStyle(color: Colors.black,fontSize: 25),),
        ),
        const SizedBox(height: 5,),
        const Align(
          alignment: Alignment.topLeft,
          child: Text('Full of protein made of soy with vegetables \nserved with bread and yogurt',),
        ),
        const SizedBox(height: 12,),
        const Align(
          alignment: Alignment.topLeft,
          child: Text('190 Calories per serving',),
        ),
        const SizedBox(height: 13,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text('17%',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('FAT'),
                )
              ],
            ),
            Column(
              children: const [
                Text('38%',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('PROTEIN'),
                )
              ],
            ),
            Column(
              children: const [
                Text('24%',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('CHOLESTEROL'),
                )
              ],
            ),
            Column(
              children: const [
                Text('32%',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('CARB'),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
  
  Widget ingredientDetails(BuildContext context){
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text('INGREDIENTS',style: TextStyle(fontSize: 20),),
        ),
        const SizedBox(height: 8,),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/5,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Padding(padding: const EdgeInsets.only(left: 8,right: 8),
                child:  Container(
                  width: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                        child: Image.asset('assets/images/salt.png'),
                      ),
                      const SizedBox(height: 5,),
                      const Center(
                        child:   Text('Salt',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),),
              Padding(padding: const EdgeInsets.only(right: 8),
                child:  Container(
                  width: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                        child: Image.asset('assets/images/meat.png'),
                      ),
                      const SizedBox(height: 5,),
                      const Center(
                        child:   Text('Red Meat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),),
              Padding(padding: const EdgeInsets.only(right: 8),
                child:  Container(
                  width: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                        child: Image.asset('assets/images/garammasala.png'),
                      ),
                      const SizedBox(height: 5,),
                      const Center(
                        child:   Text('Garam Masala',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),),
              Padding(padding: const EdgeInsets.only(right: 8,left: 8),
                child:  Container(
                  width: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 3),
                        child: Image.asset('assets/images/parsley.png'),
                      ),
                      const SizedBox(height: 5,),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child:   Text('Parsley',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),)
            ],
          ),
        )
      ],
    );
  }

  Widget makingSteps(){
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text('MAKING STEPS',style: TextStyle(fontSize: 20),),
        ),
        const SizedBox(height: 8,),
        ListView(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: const Text('1',style: TextStyle(color: Colors.white),)),
              title: const Text("Lorem Ipsum sit amet"),
            ),
            const Divider(),
            ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: const Text('2',style: TextStyle(color: Colors.white),)),
              title: const Text("Lorem Ipsum sit amet"),
            ),
            const Divider(),
            ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: const Text('3',style: TextStyle(color: Colors.white),)),
              title: const Text("Lorem Ipsum sit amet"),
            ),
            const Divider(),
            ListTile(
              leading: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: const Text('4',style: TextStyle(color: Colors.white),)),
              title: const Text("Lorem Ipsum sit amet"),
            ),
            const Divider(),
          ],
        )
      ],
    );
  }
}