
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Model model;

   RecipeDetailsPage({required this.model });

  List<Model> list=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              child: Stack(
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
                      child: Text(model.label.toString(),
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
                            image: NetworkImage(model.image.toString()),
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
                          String link=model.shareAs.toString();
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



                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20,top: 8,bottom: 4),
              child: Text('Health Labels:',
                style: TextStyle(
                  color: Color(0xFFCBCFD4),
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 86,height: 18,
                  margin: EdgeInsets.only(top: 0,left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD9D9D9)
                  ),
                  child: Center(
                    child: Text('Mediterranean',
                      style: TextStyle(
                        color: Color(0xFF3C444C),
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 76,height: 18,
                  margin: EdgeInsets.only(top: 0,left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD9D9D9)
                  ),
                  child: Center(
                    child: Text('Peanut-Free',
                      style: TextStyle(
                        color: Color(0xFF3C444C),
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 85,height: 18,
                  margin: EdgeInsets.only(top: 0,left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFD9D9D9)
                  ),
                  child: Center(
                    child: Text('Tree-Nut-Free',
                      style: TextStyle(
                        color: Color(0xFF3C444C),
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(left: 20,top: 8,bottom: 4),

              child: Text('Cuisine Type:',
                style: TextStyle(
                  color: Color(0xFFCBCFD4),
                  fontFamily: 'Poppins',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 18,width: 50,
              margin: EdgeInsets.only(top: 0,left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFD9D9D9)
              ),
              child: Center(
                      child: Text(model.cuisineType.join(' '),
                        style: TextStyle(
                          color: Color(0xFF3C444C),
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )

            ),
            Container(
              padding: EdgeInsets.only(left: 20,top: 8,bottom: 4),

              child: Text('Ingredients',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container(
              height: 100,
              padding: EdgeInsets.only(left: 16,top: 0,bottom: 4),

              //width: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: model.ingredientLines.map((e) => Container(
                    height: 90,width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                   // color: Color(0xFFD9D9D9),
                    child: Card(
                      color: Colors.lightGreenAccent,
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e,
                          style: TextStyle(
                            color: Color(0xFF3C444C),
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                    )
                  )).toList()
                ),
              ),
            ),


            Container(
              padding: EdgeInsets.only(left: 20,top: 0,bottom: 4),

              child: Text('Preparation',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Instructions on',
                style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w300,fontSize: 10,color: Color(
                    0xFF747D88)),
              ),
              Text(' BBC Food',
                style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w700,fontSize: 10,color: Color(0xFF747D88)),
              ),
              Transform.rotate(
                angle: 90 * (3.141592653589793238 / 180), // 90 degrees in radians
                child: Icon(Icons.arrow_forward_ios_sharp,size: 10,color: Color(0xFF3C444C),),
              )

            ],
          ),
            Container(
              //width: 71,height: 24,
              padding: EdgeInsets.only(left: 20,top: 0,bottom: 4),
              child: Text('Nutrition',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,),
              child: Container(
                width: 325,height: 75,
                // padding: EdgeInsets.only(left: 20,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),    // Top-left corner: 0px radius
                      topRight: Radius.circular(25),   // Top-right corner: 25px radius
                      bottomLeft: Radius.circular(25), // Bottom-left corner: 25px radius
                      bottomRight: Radius.circular(25),
                    ),
                    color: Color(0xFF7EEF03)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 38,height: 23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFFD9D9D9)
                            ),
                            child: Center(
                              child: Text('146',
                                style: TextStyle(
                                  color: Color(0xFF3C444C),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Text('CAL/SERV',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Text('|'),
                        height: 40,width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 38,height: 23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFFD9D9D9)
                            ),
                            child: Center(
                              child: Text('7%',
                                style: TextStyle(
                                  color: Color(0xFF3C444C),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Text('DAILY VALUE',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Text('|'),
                        height: 40,width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 38,height: 23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFFD9D9D9)
                            ),
                            child: Center(
                              child: Text('8',
                                style: TextStyle(
                                  color: Color(0xFF3C444C),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Text('SERVINGS',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20,top: 0,bottom: 4),
              child: Text('Tags',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 0,bottom: 4),
              child: Container(
                width: 327,height: 60,
                child: Text(model.healthLabels.join(', '),
                  style: TextStyle(
                    color: Color(0xFF747D88),
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              //width: 71,height: 24,
              padding: EdgeInsets.only(left: 20,top: 0,bottom: 4),
              child: Text('Nutrition',
                style: TextStyle(
                  color: Color(0xFF3C444C),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 320,height: 52,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
          ),
        ]
              ),
                child: Container(
                  //  width: 253,height: 42.55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFFFFFFFF)
                    ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 73,height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xFF7EEF03)
                        ),
                        child: Center(
                          child: Text('Fat',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 73,height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                           // color: Color(0xFF7EEF03)
                        ),
                        child: Center(
                            child: Text('Carbs',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      ),
                      ),
                      Container(
                        width: 73,height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                           // color: Color(0xFF7EEF03)
                        ),
                        child: Center(
                            child: Text('Protien',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ),
                      ),
                      Container(
                        width: 73,height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                           // color: Color(0xFF7EEF03)
                        ),
                        child: Center(
                            child: Text('Cholesterol',
                              style: TextStyle(
                                color: Color(0xFF3C444C),
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: Container(
                width: 325,height: 100,
               // padding: EdgeInsets.only(left: 20,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),    // Top-left corner: 0px radius
                    topRight: Radius.circular(25),   // Top-right corner: 25px radius
                    bottomLeft: Radius.circular(25), // Bottom-left corner: 25px radius
                    bottomRight: Radius.circular(25),
                  ),
                  color: Color(0xFF7EEF03)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Fat',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Transform.rotate(
                            angle: 90 * (3.141592653589793238 / 180), // 90 degrees in radians
                            child: Icon(Icons.arrow_forward_ios_sharp,size: 10,color: Color(0xFF3C444C),),
                          )

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('7g',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Text('11%',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Cholesterol',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 60,),
                          Text('1g',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Text('7%',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Trans',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 60,),
                          Text('0g',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Text('0%',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Monounsaturated',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 60,),
                          Text('4g',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Text('0%',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Polyunsaturated',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 60,),
                          Text('1g',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Text('7%',
                            style: TextStyle(
                              color: Color(0xFF3C444C),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

               SizedBox(height: 10,)
          ],
        ),
      )

    );
  }
}

