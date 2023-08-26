import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';

class RecipeDetailsPage extends StatefulWidget {
  final String image, url, source,label,calories,shareAs,ingredients,healthLabels,cuisineType;
   RecipeDetailsPage({required this.image,required this.url,required this.source,required this.label,required this.calories,required this.shareAs,required this.ingredients,required this.healthLabels,required this.cuisineType});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  List<Model> list=[];

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
                        child: Text('Search...',style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFFCBCFD4)),),
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
          Positioned(
            width: 147,
              height: 50,
              top: 108,
              left: 24,
              child: Text(widget.label.toString(),
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),)),
          Positioned(
              width: 168,height: 168,
              top: 100,left: 178,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.image.toString()),
                  ),
                ),
              )),
          Positioned(
            width: 132,height: 26,top: 150,left: 25,
              child: InkWell(
                child: Text('See full recipe on:\nBBC Good Food',
                  style: TextStyle(
                    color: Color(0xFF3C444C),
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),),
          Positioned(
            top: 197,left: 29,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF1AE823)
                  ),
              child: InkWell(child: Container(
                  width: 22,height: 22,
                  child: Image.asset('assets/images/img_1.png',fit: BoxFit.contain,)))),),
          Positioned(
           top: 197,left: 59,
              child: DecoratedBox(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFF1AE823)
              ),
              child: InkWell(
                onTap: ()async{
                  String link=widget.shareAs.toString();
                  if (await canLaunch(link)) {
                  await launch(link); // Open the URL in a browser
                  } else {
                  print('Could not launch $link');
                  }
                },
                child: Container(
                    width: 22,height: 22,
                    child: Image.asset('assets/images/img_2.png',fit: BoxFit.contain,)),
              ))),
          Positioned(
            width: 79,height: 17,top: 252,left: 24,
              child: Text('Health Labels:',
                style: TextStyle(
                  color: Color(0xFFCBCFD4),
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Positioned(
            width: 310,
              height: 20,
              top: 274,left: 22,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.healthLabels.length,
                    itemBuilder: (context, index){
                      return Center(
                        child: Text(widget.healthLabels[index].toString(),
                          style: TextStyle(
                            color: Color(0xFF3C444C),
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }),
              )),
          Positioned(
              width: 75,height: 17,top: 296,left: 24,
              child: Text('Cuisine Type:',
                style: TextStyle(
                  color: Color(0xFFCBCFD4),
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Positioned(
            width: 100,height: 30,
              top: 312,left: 22,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.cuisineType.length,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                     // width: 53,
                     // height: 20,
                      decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text(widget.cuisineType[index],
                        style: TextStyle(
                          color: Color(0xFF3C444C),
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  })),
          Positioned(
            width: 93,height: 24,top: 335,left: 24,
              child: Text('Ingredients',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
          ),



        ],
      )

    );
  }
}
