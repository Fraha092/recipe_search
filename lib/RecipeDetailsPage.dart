import 'package:flutter/material.dart';

import 'model.dart';

class RecipeDetailsPage extends StatefulWidget {
  final String recipeDetailList;
   RecipeDetailsPage({required this.recipeDetailList});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  List<Model> list=<Model>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -20.21,
              left: 202.11,
              child: Container(
                width: 227.96,
                height: 266.54,
                child: Image.asset("assets/images/img.png"),
              )),
          Positioned(
              width: 24,height: 24,top: 20,left: 320,
              child: Icon(Icons.menu_outlined,weight: 14,)),
          Positioned(
            top: 13,left: 60,
              child: Container(
            width: 253,
            height: 42.55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
                child: Container(
                  width: 253,height: 42.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFFFFF)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(Icons.search,color: Color(0xFF3C444C),size: 20,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Search...',style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.w400,fontSize: 14,color: Color(
                            0xFFCBCFD4)),),
                      )
                    ],
                  ),
                ),
          ),
          ),
          Positioned(
              width: 42,height: 42,top: 14,left: 10,
              child: Image.asset('assets/images/image 13.png')),
          Positioned(
              width: 273,
              height: 78,
              top: 30,
              left: 60,
              child: Row(
                children: [
                  Text('REFINE SEARCH BY',
                    style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontSize: 10,color: Color(
                        0xFF747D88)),
                  ),
                  Text(' Calories, Diet, Ingredients',
                    style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w700,fontSize: 10,color: Color(0xFF747D88)),
                  ),
                  Transform.rotate(
                    angle: 90 * (3.141592653589793238 / 180), // 90 degrees in radians
                    child: Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Color(0xFF3C444C),),
                  )

                ],
              )),
          Positioned(child: Text(widget.recipeDetailList.toString()))
        ],
      )

    );
  }
}
